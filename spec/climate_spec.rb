require_relative '../model/climate'

RSpec.describe Climate do
  let(:climate) {Climate.new}

  describe "#temperature" do
    context "when initialised with no previous days temperature" do
      it "will default to a temperature in a default range" do
        expect(climate).to receive(:rand).with(Climate::INITIAL_TEMPERATURE - Climate::TEMPERATURE_VARIANCE..Climate::INITIAL_TEMPERATURE + Climate::TEMPERATURE_VARIANCE).and_return(20)
        expect(climate.temperature).to eq 20
      end
    end

    context "when initializing with a previous days temperature" do
      let(:custom_temp) {50}

      it "will be within a range of that temperature" do
        climate = Climate.new(previous_temperature: custom_temp)
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