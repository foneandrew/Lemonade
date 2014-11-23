require_relative 'climate'
require_relative 'population'

class Day
  INITIAL_TEMPERATURE = 20.0

  def initialize(previous_temperature: INITIAL_TEMPERATURE)
    @climate = Climate.new(previous_temperature: previous_temperature)
    @population = Population.new(@climate.temperature)
  end

  def temperature
    @climate.temperature
  end

  def passing_people
    @population.pedestrians
  end
end