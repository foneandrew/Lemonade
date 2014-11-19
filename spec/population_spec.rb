require_relative '../model/population'

RSpec.describe Population do
  describe "#walkers" do
    context "number of walkers should be" do
      it "larger on hotter days" do
        population_hot = Population.new(50)
        population_cold = Population.new(30)

        expect(population_hot.walkers).to be >= population_cold.walkers
      end
    end
  end
end