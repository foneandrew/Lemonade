class Climate
  TEMPERATURE_VARIANCE = 5

  def initialize(temperature)
    @origin_temp = temperature
  end

  def temperature
    @temperature ||= rand(@origin_temp - TEMPERATURE_VARIANCE..@origin_temp + TEMPERATURE_VARIANCE)
  end
end