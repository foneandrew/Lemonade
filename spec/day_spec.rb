require_relative '../model/day'
require_relative '../model/climate'
require_relative '../model/population'

RSpec.describe Day do
  describe "#new" do
    context "when created with no previous temperature" do
      let(:day) {Day.new}

      it "will have a temperature" do
        expect(day.temperature).not_to eq nil
      end

      it "will have people who walk by the store" do
        expect(day.passing_people).not_to eq nil
      end
    end

    context "when created with a previous temperature given" do
      let(:temperature) {100}
      let(:day) {Day.new(temperature)}
      let(:climate) {instance_double("Climate")}

      it "will have a temperature" do
        expect(day.temperature).not_to eq nil
      end

      it "will have people who walk by the store" do
        expect(day.passing_people).not_to eq nil
      end

      it "uses that temperature to determine the new temperature" do  
        expect(Climate).to receive(:new).with(temperature).and_return(climate)
        expect(climate).to receive(:temperature).and_return(temperature)
        day
      end
    end
  end
end