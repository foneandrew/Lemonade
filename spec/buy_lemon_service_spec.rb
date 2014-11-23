require_relative '../lib/service/buy_lemon_service'
require_relative '../lib/model/market'
require_relative '../lib/model/inventory'

RSpec.describe BuyLemonService do
  describe "#buy" do
    let(:lemon_price) {50}
    let(:inventory) {Inventory.new}
    let(:market) {instance_double('Market')}
    let(:service) {BuyLemonService.new(inventory: inventory, market: market)}

    before do
      allow(market).to receive(:lemon_price).and_return(lemon_price)
    end

    context "when buying lemons" do
      let(:num_lemons) {5}

      context "with enough cents in the inventory" do
        before do
          inventory.add_cents((num_lemons * lemon_price) + 1)
          inventory.add_lemons(1)
        end

        it "uses the market to get the price" do
          expect(market).to receive(:lemon_price).and_return(lemon_price)
          service.buy(num_lemons)
        end

        it "returns true" do
          expect(service.buy(num_lemons)).to eq true
        end

        it "adds the bought number of lemons to inventory" do
          expect {
            service.buy(num_lemons)
          }.to change{inventory.lemons}.by num_lemons
        end

        it "removes the cents from inventory (number of lemons * lemon price)" do
          expect {
            service.buy(num_lemons)
          }.to change{inventory.cents}.by -(num_lemons * lemon_price)
        end
      end

      context "without enough cents in the inventory" do
        before do
          inventory.add_cents((num_lemons * lemon_price) - 1)
          inventory.add_lemons(1)
        end

        it "returns false" do
          expect(service.buy(num_lemons)).to eq false
        end

        it "does not add any lemons" do
          expect {
            service.buy(num_lemons)
          }.to change{inventory.lemons}.by 0
        end

        it "does not remove any cents from inventory" do
          expect {
            service.buy(num_lemons)
          }.to change{inventory.cents}.by 0
        end
      end
    end
  end
end