require_relative '../lib/service/buy_sugar_service'
require_relative '../lib/model/market'
require_relative '../lib/model/inventory'

RSpec.describe BuySugarService do
  describe "#buy" do
    let(:sugar_price) {5}
    let(:inventory) {Inventory.new}
    let(:market) {instance_double('Market')}
    let(:service) {BuySugarService.new(inventory: inventory, market: market)}

    before do
      allow(market).to receive(:sugar_price).and_return(sugar_price)
    end

    context "when buying sugar" do
      let(:num_sugar) {5}

      context "with enough cents in the inventory" do
        before do
          inventory.add_cents((num_sugar * sugar_price) + 1)
          inventory.add_sugar(1)
        end

        it "uses the market to get the price" do
          expect(market).to receive(:sugar_price).and_return(sugar_price)
          service.buy(num_sugar)
        end

        it "returns true" do
          expect(service.buy(num_sugar)).to eq true
        end

        it "adds the bought number of sugar to inventory" do
          expect {
            service.buy(num_sugar)
          }.to change{inventory.sugar}.by num_sugar
        end

        it "removes the cents from inventory (number of sugar * sugar price)" do
          expect {
            service.buy(num_sugar)
          }.to change{inventory.cents}.by -(num_sugar * sugar_price)
        end
      end

      context "without enough cents in the inventory" do
        before do
          inventory.add_cents((num_sugar * sugar_price)-0.01)
          inventory.add_sugar(1)
        end

        it "returns false" do
          expect(service.buy(num_sugar)).to eq false
        end

        it "does not add any sugar" do
          expect {
            service.buy(num_sugar)
          }.to change{inventory.sugar}.by 0
        end

        it "does not remove any cents from inventory" do
          expect {
            service.buy(num_sugar)
          }.to change{inventory.cents}.by 0
        end
      end
    end
  end
end