class Inventory
  attr_reader :lemons, :sugar, :cups, :cents

  def initialize
    @lemons = 0
    @sugar = 0
    @cups = 0
    @cents = 0
  end

  #adding a negative amount of something is kinda dumb
  #split into specific methods
  #consider what other classes will need to call on Inventory, ie what features
  #and methods it needs to provide, and how to do that so that it reads nicely

  def add_lemons(number_of_lemons)
    raise "cannot add negative lemons (tried to add #{number_of_lemons})" if number_of_lemons < 0
    @lemons += number_of_lemons
  end

  def remove_lemons(number_of_lemons)
    raise "cannot remove negative lemons (tried to remove #{number_of_lemons})" if number_of_lemons < 0
    raise "resulting number of lemons cannot be negative" if (@lemons - number_of_lemons) < 0
    @lemons -= number_of_lemons
  end

  def add_sugar(number_of_sugar)
    raise "cannot add negative sugar (tried to add #{number_of_sugar})" if number_of_sugar < 0
    @sugar += number_of_sugar
  end

  def remove_sugar(number_of_sugar)
    raise "cannot remove negative sugar (tried to remove #{number_of_sugar})" if number_of_sugar < 0
    raise "resulting number of sugar cannot be negative" if (@sugar - number_of_sugar) < 0
    @sugar -= number_of_sugar
  end

  def cups=(number_of_cups)
    raise "number of cups cannot be less than zero (tried to make cups = #{number_of_cups})" if number_of_cups < 0
    @cups = number_of_cups
  end

  def add_cents(cents_amount)
    raise "cannot add negative cents (tried to add #{cents_amount})" if cents_amount < 0
    @cents += cents_amount.to_i
  end

  def remove_cents(cents_amount)
    raise "cannot remove negative cents (tried to remove #{cents_amount})" if cents_amount < 0
    raise "resulting cents cannot be negative" if (@cents - cents_amount) < 0
    @cents -= cents_amount.to_i
  end
end