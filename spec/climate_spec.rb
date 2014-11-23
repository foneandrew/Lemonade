require_relative '../lib/model/climate'

RSpec.describe Climate do
  describe "#temperature" do
      let(:custom_temp) {20}
      let(:climate) {Climate.new(previous_temperature: custom_temp)}
      let(:max_temp) {Climate::MAX_TEMPERATURE}
      let(:min_temp) {Climate::MIN_TEMPERATURE}

    context "when initializing with a previous days temperature" do
      it "will be within a range of that temperature" do
        expect(Kernel).to receive(:rand).with(custom_temp - Climate::TEMPERATURE_VARIANCE..custom_temp + Climate::TEMPERATURE_VARIANCE).and_return(custom_temp)
        expect(climate.temperature).to eq custom_temp
      end
    end

    context "when asked for temperature consecutively" do
      it "should be the same as the first returned value" do
        temperature = climate.temperature
        10.times {expect(climate.temperature).to eq temperature}
      end
    end

    context "when succesively generated temperatures are increasing" do
      before do
        allow(Kernel).to receive(:rand).and_return(max_temp * 2)
      end

      it "will reach an upper limit and not go above it" do
        expect(Climate.new(previous_temperature: max_temp * 2).temperature).to eq max_temp
      end
    end

    context "when succesively generated temperatures are decreasing" do
      before do
        allow(Kernel).to receive(:rand).and_return(min_temp * 2)
      end

      it "will reach an upper limit and not go above it" do
        expect(Climate.new(previous_temperature: min_temp * 2).temperature).to eq min_temp
      end
    end
  end
end