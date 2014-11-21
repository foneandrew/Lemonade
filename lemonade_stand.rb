require_relative 'model/inventory'
require_relative 'view/text_interface'

class LemonadeStand
  STARTING_MONEY = 10.0

  def initialize
    @inventory = Inventory.new
    @inventory.add_money(STARTING_MONEY)

    play_a_day(Day.new)
  end

  def play_a_day(day)
    market = Market.new
    buy_lemons = BuyLemonService.new(inventory: @inventory, market: market)
    buy_sugar = BuySugarService.new(inventory: @inventory, market: market)
    make_lemonade = MakeLemonadeService.new(@inventory)

    sell_lemonade = SellLemonadeService.new(pedestrians: day.passing_people, inventory: @inventory)

  end
end