require_relative '../model/climate'

RSpec.describe Climate do
  describe "#temperature" do
      let(:custom_temp) {50}
      let(:climate) {Climate.new(custom_temp)}

    context "when initializing with a previous days temperature" do
      it "will be within a range of that temperature" do
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