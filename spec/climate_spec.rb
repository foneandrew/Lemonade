require_relative '../model/climate'

RSpec.describe Climate do
  let(:climate) {Climate.new}

  describe "#temperature" do
    context "when initializing with a previous days temperature" do
      let(:custom_temp) {50}

      it "will be within a range of that temperature" do
        climate = Climate.new(custom_temp)
        expect(climate).to receive(:rand).with(custom_temp - Climate::TEMPERATURE_VARIANCE..custom_temp + Climate::TEMPERATURE_VARIANCE).and_return(custom_temp)
        expect(climate.temperature).to eq custom_temp
      end
    end

    context "when asked for temperature consecutively" do
      it "should be the same as the first returned value" do
        temperature = climate.temperature
        10.times {expect(climate.temperature).to eq temperature}
      end
    end
  end
end