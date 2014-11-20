require_relative '../service/lemonade_making_service'

RSpec.describe LemonadeMakingService do
  let(:inventory) {Inventory.new}
  let(:service) {LemonadeMakingService.new(inventory)}

  describe "#call" do
    context "when the inventory has enough ingredients" do
      it "adds the right amount of cups, and removes the right ingredients" do
      end
    end
  end
end