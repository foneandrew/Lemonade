require_relative '../service/demand_lemonade_service'
require_relative '../model/population'

RSpec.describe DemandLemonadeService do
  describe "#call" do
    let(:population) {instance_double('Population')}
    let(:service) {DemandLemonadeService.new(population)}
    let(:lemonade_price) {2}
    let(:pedestrians_high) {70}
    let(:pedestrians_low) {30}

    context "when selling lemonade" do
      it "checks the number of pedestrians from Population" do
        expect(population).to receive(:pedestrians).and_return(0)
        service.call(lemonade_price)
      end

      it "returns the number of people who are in demand of lemonade (non-negative)" do
        expect(population).to receive(:pedestrians).and_return(0)
        expect(service.call(lemonade_price)).to be >= 0
      end

      it "returns an integer value" do
        allow(population).to receive(:pedestrians).and_return(0)
        price = service.call(lemonade_price)
        expect(service.call(lemonade_price)).to eq price.to_i
      end

      context "when the number of pedestrians is lower" do
        let(:population_low) {instance_double('Population')}
        let(:population_high) {instance_double('Population')}
        let(:service_lower) {DemandLemonadeService.new(population_low)}
        let(:service_higher) {DemandLemonadeService.new(population_high)}

        before do
          allow(population_low).to receive(:pedestrians).and_return(pedestrians_low)
          allow(population_high).to receive(:pedestrians).and_return(pedestrians_high)
        end

        it "demand will be lower" do
          expect(service_lower.call(lemonade_price)).to be <= service_higher.call(lemonade_price)
        end
      end

      context "when the price is higher" do
        let(:service_lower) {DemandLemonadeService.new(population)}
        let(:service_higher) {DemandLemonadeService.new(population)}
        let(:price_high) {5}
        let(:price_low) {1}

        before do
          allow(population).to receive(:pedestrians).and_return(pedestrians_low)
        end

        it "demand will be lower" do
          expect(service_lower.call(price_high)).to be <= service_higher.call(price_low)
        end
      end
    end
  end
end
