class Climate
  INITIAL_TEMPERATURE = 20
  TEMPERATURE_VARIANCE = 5
  attr_reader :origin_temp

  def initialize(temperature = INITIAL_TEMPERATURE)
    @origin_temp = temperature
  end

  def temperature
    @temperature ||= rand(@origin_temp - TEMPERATURE_VARIANCE..@origin_temp + TEMPERATURE_VARIANCE)
  end
end