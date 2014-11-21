require_relative '../model/market'

class SellLemonadeService
  def initialize(pedestrians)
    @pedestrians = pedestrians
  end

  def demand(price)
    lemon_avg_price = Market::LEMON_PRICE_MIN + ((Market::LEMON_PRICE_MAX - Market::LEMON_PRICE_MIN) / 2)
    sugar_avg_price = Market::SUGAR_PRICE_MIN + ((Market::SUGAR_PRICE_MAX - Market::SUGAR_PRICE_MIN) / 2)
    #at break even price, you will get 100+ % demand
    break_even_price = lemon_avg_price + sugar_avg_price
    demand = break_even_price / price
    (@pedestrians * demand).to_i
  end
end