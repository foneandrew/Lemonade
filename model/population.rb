class Population
  attr_reader :walkers
  
  def initialize(temperature)
    @walkers = temperature
  end
end