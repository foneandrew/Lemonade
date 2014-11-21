require_relative '../service/sell_lemonade_service'

RSpec.describe SellLemonadeService do
  describe "#demand" do
    let(:pedestrians_high) {70}
    let(:pedestrians_low) {30}
    let(:service) {SellLemonadeService.new(pedestrians: pedestrians_low)}
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
        let(:service_lower) {SellLemonadeService.new(pedestrians: pedestrians_low)}
        let(:service_higher) {SellLemonadeService.new(pedestrians: pedestrians_high)}

        it "demand will be lower" do
          expect(service_lower.demand(lemonade_price)).to be <= service_higher.demand(lemonade_price)
        end
      end

      context "when the price is higher" do
        let(:service_lower) {SellLemonadeService.new(pedestrians: pedestrians_low)}
        let(:service_higher) {SellLemonadeService.new(pedestrians: pedestrians_low )}
        let(:price_high) {5}
        let(:price_low) {1}

        it "demand will be lower" do
          expect(service_lower.demand(price_high)).to be <= service_higher.demand(price_low)
        end
      end
    end
  end

  describe "#sell" do
    context "selling lemonade" do
      let(:inventory) {Inventory.new}
      let(:pedestrians) {50}
      let(:service) {SellLemonadeService.new(inventory: inventory, pedestrians: pedestrians)}
      let(:cups) {10}
      let(:lemonade_price) {2}

      context "if the sale is successful" do
        before do
          inventory.cups = cups
          allow(service).to receive(:demand).and_return(cups)
        end

        it "returns the number of lemonades bought (non-negative)" do
          expect(service.sell(lemonade_price)).to be > 0
        end

        it "removes ALL lemonades from the inventory" do
          expect{
            service.sell(lemonade_price)
          }.to change{inventory.cups}.to eq 0
        end

        it "adds the profit to the inventory" do
          expect{
            service.sell(lemonade_price)
          }.to change{inventory.money}.by cups * lemonade_price
        end
      end

      context "when demand is higher than the supply of lemonade" do
        before do
          inventory.cups = cups
          allow(service).to receive(:demand).and_return(cups * 2)
        end
        
        it "only sells the amount of lemonade that is in the inventory" do
          expect(service.sell(lemonade_price)).to eq cups
        end
      end

      context "when supply of lemonade is higher than demand" do
        before do
          inventory.cups = cups * 2
          allow(service).to receive(:demand).and_return(cups)
        end
        
        it "only sells the amount of lemonade that was in demand" do
          expect(service.sell(lemonade_price)).to eq cups
        end
      end
    end
  end
end