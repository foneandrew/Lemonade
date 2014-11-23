class Climate
  TEMPERATURE_VARIANCE = 10
  #using climate data from https://www.niwa.co.nz/education-and-training/schools/resources/climate/extreme
  MAX_TEMPERATURE = 42.4
  MIN_TEMPERATURE = -25.6

  def initialize(previous_temperature:)
    @origin_temp = previous_temperature
  end

  def temperature
    @temperature ||= generate_temperature
  end

  private

  def generate_temperature
    new_temperature = ::Kernel.rand(@origin_temp - TEMPERATURE_VARIANCE..@origin_temp + TEMPERATURE_VARIANCE).round(1)
    [MIN_TEMPERATURE, new_temperature, MAX_TEMPERATURE].sort[1]
  end
end