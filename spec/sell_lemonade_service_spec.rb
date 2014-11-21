require_relative '../service/sell_lemonade_service'

RSpec.describe SellLemonadeService do
  describe "#demand" do
    let(:pedestrians_high) {70}
    let(:pedestrians_low) {30}
    let(:service) {SellLemonadeService.new(pedestrians_low)}
    let(:lemonade_price) {2}

    context "when selling lemonade" do
      it "returns the number of people who are in demand of lemonade (non-negative)" do
        expect(service.demand(lemonade_price)).to be >= 0
      end

      it "returns an integer value" do
        price = service.demand(lemonade_price)
        expect(service.demand(lemonade_price)).to eq price.to_i
      end

      context "when the number of pedestrians is lower" do
        let(:service_lower) {SellLemonadeService.new(pedestrians_low)}
        let(:service_higher) {SellLemonadeService.new(pedestrians_high)}

        it "demand will be lower" do
          expect(service_lower.demand(lemonade_price)).to be <= service_higher.demand(lemonade_price)
        end
      end

      context "when the price is higher" do
        let(:service_lower) {SellLemonadeService.new(pedestrians_low)}
        let(:service_higher) {SellLemonadeService.new(pedestrians_low )}
        let(:price_high) {5}
        let(:price_low) {1}

        it "demand will be lower" do
          expect(service_lower.demand(price_high)).to be <= service_higher.demand(price_low)
        end
      end
    end
  end

  describe "#call" do
    context "selling lemonade" do
      context "if the sale is successful" do
        it "returns the number of lemonades bought (non-negative)" do
          #let(:inventory) {Inventory.new}
          #let(:service) {SellLemonadeService.new(inventory, pedestrians, lemonade_price)}
          #expect(service.call(2)).to be > 0
        end
      end
    end
  end
end