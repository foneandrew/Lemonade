require_relative '../model/Inventory'

class MakeLemonadeService
  def initialize(inventory:)
    @inventory = inventory
  end

  def make(num_cups)
    return false if @inventory.sugar < num_cups || @inventory.lemons < num_cups
    @inventory.cups = num_cups
    @inventory.remove_lemons(num_cups)
    @inventory.remove_sugar(num_cups)
    true
  end
end