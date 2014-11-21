require_relative '../model/population'
require_relative '../model/market'

class DemandLemonadeService
  def initialize(population)
    @population = population
  end

  def call(price)
    lemon_avg_price = Market::LEMON_PRICE_MIN + ((Market::LEMON_PRICE_MAX - Market::LEMON_PRICE_MIN) / 2)
    sugar_avg_price = Market::SUGAR_PRICE_MIN + ((Market::SUGAR_PRICE_MAX - Market::SUGAR_PRICE_MIN) / 2)
    #at break even price, you will get 100+ % demand
    break_even_price = lemon_avg_price + sugar_avg_price
    demand = break_even_price / price
    @population.pedestrians * demand
  end
end