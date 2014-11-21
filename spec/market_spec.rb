require_relative '../model/market'

RSpec.describe Market do
  let(:market) {Market.new}

  describe "#lemon_price" do
    context "when asked initially" do
      it "lemons should have a price between the min and max lemon price" do
        expect(market).to receive(:rand).with(Market::LEMON_PRICE_MIN..Market::LEMON_PRICE_MAX).and_return(25)
        expect(market.lemon_price).to eq 25
      end 

      context "when called consecutively" do
        it "should be the same as the first returned value" do
          lemon_price = market.lemon_price
          10.times {expect(market.lemon_price).to eq lemon_price}
        end
      end
    end
  end

  describe "#sugar_price" do
    context "when called initially" do
      it "sugar should have a price between the min and max sugar price" do
        expect(market).to receive(:rand).with(Market::SUGAR_PRICE_MIN..Market::SUGAR_PRICE_MAX).and_return(2)
        expect(market.sugar_price).to eq 2
      end

      context "when called consecutively" do
        it "should be the same as the first returned value" do
          sugar_price = market.sugar_price
          10.times {expect(market.sugar_price).to eq sugar_price}
        end
      end
    end
  end
end