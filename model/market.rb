class Market
  LEMON_PRICE_MAX = 0.50
  LEMON_PRICE_MIN = 0.25
  SUGAR_PRICE_MIN = 0.02
  SUGAR_PRICE_MAX = 0.05

  def lemon_price
    @lemon_price ||= rand(LEMON_PRICE_MIN..LEMON_PRICE_MAX)
  end

  def sugar_price
    @sugar_price ||= rand(SUGAR_PRICE_MIN..SUGAR_PRICE_MAX)
  end
end