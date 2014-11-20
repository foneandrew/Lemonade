require_relative 'climate'

class Population
  MAX_PEDESTRIANS = 100
  MIN_PEDESTRIANS = 0
  attr_reader :pedestrians
  
  def initialize(temperature)
    @pedestrians = determine_number_of_pedestrians(temperature).to_i
  end

  private

  def determine_number_of_pedestrians(temperature)
    temp_max = Climate::MAX_TEMPERATURE - Climate::MIN_TEMPERATURE
    temperature -= Climate::MIN_TEMPERATURE
    percentage_of_temperature_range = (temperature / temp_max)

    pedestrian_range = (MAX_PEDESTRIANS - MIN_PEDESTRIANS)
    
    (percentage_of_temperature_range * pedestrian_range) + MIN_PEDESTRIANS
  end
end