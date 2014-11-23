require_relative '../lib/model/population'
require_relative '../lib/model/climate'

RSpec.describe Population do
  describe "#pedestrians" do
    context "number of pedestrians should be" do
      it "larger on hotter days" do
        population_hot = Population.new(50)
        population_cold = Population.new(30)

        expect(population_hot.pedestrians).to be >= population_cold.pedestrians
      end
    end

    context "at the temperate extremes" do
      context "at max temperature" do
        it "will have max population" do
          population = Population.new(Climate::MAX_TEMPERATURE)
          expect(population.pedestrians).to eq Population::MAX_PEDESTRIANS
        end
      end

      context "at min temperature" do
        it "will have min population" do
          population = Population.new(Climate::MIN_TEMPERATURE)
          expect(population.pedestrians).to eq Population::MIN_PEDESTRIANS
        end
      end
    end
  end
end