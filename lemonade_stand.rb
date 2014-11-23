require_relative 'model/inventory'
require_relative 'model/market'
require_relative 'model/day'
require_relative 'service/buy_sugar_service'
require_relative 'service/buy_lemon_service'
require_relative 'service/make_lemonade_service'
require_relative 'service/sell_lemonade_service'
require_relative 'view/text_interface'

class LemonadeStand
  STARTING_cents = 500

  def initialize
    @inventory = Inventory.new
    @inventory.add_cents(STARTING_cents)
    @display = TextInterface.new

    @display.new_game_welcome
    play_a_day(Day.new)
  end

  def play_a_day(day)
    @market = Market.new
    @buy_lemons = BuyLemonService.new(inventory: @inventory, market: @market)
    @buy_sugar = BuySugarService.new(inventory: @inventory, market: @market)
    @make_lemonade = MakeLemonadeService.new(@inventory)
    @sell_lemonade = SellLemonadeService.new(pedestrians: day.passing_people,
      inventory: @inventory)

    @display.start_of_day(lemon_price: @market.lemon_price, 
      sugar_price: @market.sugar_price, temperature: day.temperature,
      cents: @inventory.cents, lemons: @inventory.lemons,
      sugar: @inventory.sugar)

    player_purchase_lemons
    player_purchase_sugar
    player_make_lemonade(day.temperature)

    cups_sold, profit = player_sell_lemonade(day.temperature)
    @display.sales_report(lemonade_cups_sold: cups_sold, profit: profit,
      pedestrians: day.passing_people)

    play_a_day(Day.new(day.temperature))
  end

  private

  def player_sell_lemonade(temperature)
    loop do
      lemonade_price = (@display.sell_lemonade(lemonade: @inventory.cups, 
        temperature: temperature).to_f * 100).round

      return (@sell_lemonade.sell(lemonade_price)) if lemonade_price > 0

      @display.negative_input
    end
  end

  def player_make_lemonade(temperature)
    loop do
      num_cups = @display.make_lemonade(lemons: @inventory.lemons, 
        sugar: @inventory.sugar, temperature: temperature).to_i

      if num_cups < 0
        @display.negative_input
      elsif @make_lemonade.make(num_cups)
        return
      else
        @display.not_enough_ingredients
      end
    end
  end

  def player_purchase_lemons
    loop do
      num_lemons = @display.buy_lemons(lemon_price: @market.lemon_price,
        current_lemons: @inventory.lemons, cents: @inventory.cents).to_i

      if num_lemons < 0
        @display.negative_input
      elsif @buy_lemons.buy(num_lemons)
        @display.inventory_report(lemons: @inventory.lemons, sugar: @inventory.sugar)
        return
      else
        @display.not_enough_money
      end
    end
  end

  def player_purchase_sugar
    loop do
      num_sugar = @display.buy_sugar(sugar_price: @market.sugar_price,
        current_sugar: @inventory.sugar, cents: @inventory.cents).to_i

      if num_sugar < 0
        @display.negative_input
      elsif @buy_sugar.buy(num_sugar)
        @display.inventory_report(lemons: @inventory.lemons, sugar: @inventory.sugar)
        return
      else
        @display.not_enough_money
      end
    end
  end
end

LemonadeStand.new
exit