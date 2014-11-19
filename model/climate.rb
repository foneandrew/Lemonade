class Climate
  INITIAL_TEMPERATURE = 20
  TEMPERATURE_VARIANCE = 5

  def initialize(previous_temperature: INITIAL_TEMPERATURE)
    @origin_temp = previous_temperature
  end

  def temperature
    @temperature ||= rand(@origin_temp - TEMPERATURE_VARIANCE..@origin_temp + TEMPERATURE_VARIANCE)
  end
end