require_relative '../service/buy_lemon_service'
require_relative '../model/market'
require_relative '../model/inventory'

RSpec.describe BuyLemonService do
  describe "#call" do
    let(:lemon_price) {0.50}
    let(:inventory) {Inventory.new}
    let(:market) {instance_double('Market')}
    let(:service) {BuyLemonService.new(inventory: inventory, market: market)}

    before do
      allow(market).to receive(:lemon_price).and_return(lemon_price)
    end

    context "when buying lemons" do
      let(:num_lemons) {5}

      context "with enough money in the inventory" do
        before do
          inventory.add_money((num_lemons * lemon_price) + 1)
          inventory.add_lemons(1)
        end

        it "returns true" do
          expect(service.call(num_lemons)).to eq true
        end

        it "adds the bought number of lemons to inventory" do
          expect {
            service.call(num_lemons)
          }.to change{inventory.lemons}.by num_lemons
        end

        it "removes the money from inventory (number of lemons * lemon price)" do
          expect {
            service.call(num_lemons)
          }.to change{inventory.money}.by -(num_lemons * lemon_price)
        end
      end

      context "without enough money in the inventory" do
        before do
          inventory.add_money((num_lemons * lemon_price) - 1)
          inventory.add_lemons(1)
        end

        it "returns false" do
          expect(service.call(num_lemons)).to eq false
        end

        it "does not add any lemons" do
          expect {
            service.call(num_lemons)
          }.to change{inventory.lemons}.by 0
        end

        it "does not remove any money from inventory" do
          expect {
            service.call(num_lemons)
          }.to change{inventory.money}.by 0
        end
      end
    end
  end
end