class Market
  LEMON_PRICE_MAX = 50
  LEMON_PRICE_MIN = 25
  SUGAR_PRICE_MIN = 2
  SUGAR_PRICE_MAX = 5

  def lemon_price
    @lemon_price ||= rand(LEMON_PRICE_MIN..LEMON_PRICE_MAX)
  end

  def sugar_price
    @sugar_price ||= rand(SUGAR_PRICE_MIN..SUGAR_PRICE_MAX)
  end
end