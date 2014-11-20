require_relative '../model/day'
require_relative '../model/climate'
require_relative '../model/population'

RSpec.describe Day do
  #Day should be created
  #be immutable
  #have the temperature and number of people who walk past ready for the user to look at
  #ANOTHER CLASS WILL RECIEVE THE WALKERS AND LEMONADE PRICE TO DETERMINE BUYERS
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
      let(:climate) {instance_double("Climate")}

      it "uses that temperature to determine the new temperature" do  
        expect(Climate).to receive(:new).with(100).and_return(climate)
        expect(climate).to receive(:temperature)
        day = Day.new(100)
      end
    end
  end
end