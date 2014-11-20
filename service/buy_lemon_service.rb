require_relative '../model/inventory'

class BuyLemonService
  def initialize(inventory: inventory, market: market)
    @inventory = inventory
    @market = market
  end

  def call(number_of_lemons)
    return false if number_of_lemons * @market.lemon_price > @inventory.money
    @inventory.add_lemons(number_of_lemons)
    @inventory.remove_money(number_of_lemons * @market.lemon_price)
    true
  end
end