def min_coins(coins, amount)
  return -1 if amount < 0 

  dp = Array.new(amount + 1, amount + 1)
  dp[0] = 0

  coin_choice = Array.new(amount + 1, [])

  (1..amount).each do |i|
    coins.each do |coin|
      if coin <= i && dp[i - coin] + 1 < dp[i]
        dp[i] = dp[i - coin] + 1
        coin_choice[i] = coin_choice[i - coin] + [coin]
      end
    end
  end

  return -1 if dp[amount] > amount

  return dp[amount], coin_choice[amount]
end
