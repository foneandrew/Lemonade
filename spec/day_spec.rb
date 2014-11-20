require_relative '../model/day'
require_relative '../model/climate'

RSpec.describe Day do
  #Day should be created
  #be immutable
  #have the temperature and number of people who walk past ready for the user to look at
  #ANOTHER CLASS WILL RECIEVE THE WALKERS AND LEMONADE PRICE TO DETERMINE BUYERS
  describe "#new" do
    context "when created with no previous day" do
      let(:day) {Day.new}

      it "will have a temperature" do
        expect(day.temperature).not_to eq nil
      end

      it "will have people who walk by the store" do
        expect(day.passing_people).not_to eq nil
      end
    end

    context "when created with a previous day" do
      it "uses the previous days temperature to determine the new temperature" do
        day = Day.new(100)
        expect(Climate).to receive(:new).with(100)
        expect(day.temperature).to eq 100
      end
    end
  end
end