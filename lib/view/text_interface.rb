class TextInterface
  def initialize
  end

  def new_game_welcome
    puts "\n\n\tLemonade Stand Game!"
    puts "Try to make ALL the money by selling lemonade"
    puts "NOTE: you need 1 lemon and 1 sugar to make a cup of lemonade\n\n\n"
  end

  def inventory_report(lemons:, sugar:)
    puts "Inventory:"
    puts "\t#{english_amount(lemons)} #{pluralise("lemon", lemons)}"
    puts "\t#{english_amount(sugar)} #{pluralise("sugar", sugar)}\n\n\n"
  end

  def start_of_day(lemon_price:, sugar_price:, temperature:, cents:, lemons:, sugar:)
    puts "#{temperature_status(temperature)}"
    puts "#{money_status(cents)}"
    puts "#{inventory_status(lemons: lemons, sugar: sugar)}"
    puts "Today lemons cost #{cents_to_dollars(lemon_price)} each and sugar costs #{cents_to_dollars(sugar_price)} per lemonade cup\n\n"
  end

  def sales_report(lemonade_cups_sold:, profit:, pedestrians:)
    puts "\n\n\tSALES REPORT"
    puts "Today:"
    puts "\t#{english_amount(pedestrians)} people walked past your store"
    puts "\tYou sold #{english_amount(lemonade_cups_sold)} cups of lemonade"
    puts "\tYou made #{cents_to_dollars(profit)} from selling lemonades today\n\n"
  end

  def sell_lemonade(lemonade:, temperature:)
    puts "#{temperature_status(temperature)}"
    puts "You have #{english_amount(lemonade)} #{pluralise("cup", lemonade)} of lemonade to sell"
    puts "How much would you like to sell your lemonade for?"
    lemonade_price = gets
    puts "\n\n"
    lemonade_price
  end

  def make_lemonade(lemons:, sugar:, temperature:)
    puts "#{temperature_status(temperature)}"
    puts "#{inventory_status(lemons: lemons, sugar: sugar)}"
    puts "How many lemonades would you like to make?"
    lemonade = gets 
    puts "\n\n"
    lemonade
  end

  def buy_sugar(sugar_price:, current_sugar:, cents:)
    puts "Today sugar costs #{cents_to_dollars(sugar_price)} per cup of lemonade"
    puts "You have enough sugar for #{current_sugar} #{pluralise("cup", current_sugar)} of lemonade"
    puts "#{money_status(cents)}"
    puts "how many lemonade cups worth of sugar would you like to buy? (#{cents_to_dollars(sugar_price)} per cup)"
    sugar = gets 
    puts "\n\n"
    sugar
  end

  def buy_lemons(lemon_price:, current_lemons:, cents:)
    puts "Today lemons cost #{cents_to_dollars(lemon_price)} each"
    puts "You have #{english_amount(current_lemons)} #{pluralise("lemon", current_lemons)}"
    puts "how many lemons would you like to buy? (#{cents_to_dollars(lemon_price)} each)"
    lemons = gets
    puts "\n\n"
    lemons
  end

  def negative_input
    puts "YOU CANNOT ENTER A NEGATIVE NUMBER!!\n\n"
  end

  def not_enough_money
    puts "You don't have enough money to do that!\n\n\n"
  end

  def not_enough_ingredients
    puts "You don't have enough ingredients to make that many lemonades!\n\n\n"
  end

  private

  def cents_to_dollars(cents)
    "$#{(cents / 100.0).round(2)}"
  end

  def english_amount(number)
    number == 0 ? "no" : "#{number}"
  end

  def pluralise(word, number)
    number == 1 ? word : "#{word}s"
  end

  def money_status(cents)
    "You have #{cents_to_dollars(cents)}"
  end

  def temperature_status(temperature)
    "Today the temperature is #{temperature} degrees"
  end

  def inventory_status(lemons: lemons, sugar: sugar)
    "You have #{english_amount(lemons)} #{pluralise("lemon", lemons)}, and enough sugar for #{sugar} #{pluralise("cup", sugar)} of lemonade in your inventory"
  end
end