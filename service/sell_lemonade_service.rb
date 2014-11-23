require_relative '../model/market'

class SellLemonadeService
  EASYNESS = 1.5

  def initialize(pedestrians: pedestrians, inventory: inventory)
    @pedestrians = pedestrians
    @inventory = inventory
  end

  def sell(price)
    sold_cups = [demand(price), @inventory.cups].min
    @inventory.cups = 0
    @inventory.add_cents(sold_cups * price)
    return sold_cups, (sold_cups * price)
  end

  def demand(price)
    lemon_avg_price = Market::LEMON_PRICE_MIN + ((Market::LEMON_PRICE_MAX - Market::LEMON_PRICE_MIN) / 2)
    sugar_avg_price = Market::SUGAR_PRICE_MIN + ((Market::SUGAR_PRICE_MAX - Market::SUGAR_PRICE_MIN) / 2)
    #at break even price, you will get 100 % demand
    break_even_price = lemon_avg_price + sugar_avg_price

    break_even_price *= EASYNESS

    demand = break_even_price / price
    (@pedestrians * demand).to_i
  end
end