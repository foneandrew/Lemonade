require_relative '../model/inventory'

class BuySugarService
  def initialize(inventory: inventory, market: market)
    @inventory = inventory
    @market = market
  end

  def buy(amount_of_sugar)
    return false if amount_of_sugar * @market.sugar_price > @inventory.money
    @inventory.add_sugar(amount_of_sugar)
    @inventory.remove_money(amount_of_sugar * @market.sugar_price)
    true
  end
end