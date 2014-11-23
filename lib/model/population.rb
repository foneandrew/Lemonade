require_relative 'climate'

class Population
  MAX_PEDESTRIANS = 50
  MIN_PEDESTRIANS = 6
  attr_reader :pedestrians
  
  def initialize(temperature)
    @pedestrians = determine_number_of_pedestrians(temperature).to_i
  end

  private

  def determine_number_of_pedestrians(temperature)
    adjusted_max_temperature = Climate::MAX_TEMPERATURE - Climate::MIN_TEMPERATURE
    adjusted_temperature = temperature - Climate::MIN_TEMPERATURE
    percentage_of_temperature_range = (adjusted_temperature / adjusted_max_temperature)

    pedestrian_range = (MAX_PEDESTRIANS - MIN_PEDESTRIANS)
    
    (percentage_of_temperature_range * pedestrian_range) + MIN_PEDESTRIANS
  end
end