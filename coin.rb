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

def run
  coins = [1, 5, 10]
  puts "Монети: 1, 5, 10"

  loop do
    puts "\n1. Ввести нову суму"
    puts "2. Вийти"
    print "Оберіть опцію: "
    choice_input = gets

    if choice_input.strip.empty?
      puts "Помилка: введіть коректну опцію."
      next
    end

    choice = choice_input.chomp.to_i

    case choice
    when 1
      begin
        print "Введіть суму: "
        amount_input = gets
        if amount_input.strip.empty? 
          puts "Помилка: введіть коректну числову суму."
          next
        end

        amount = Float(amount_input.chomp).ceil

        if amount < 0
          puts "Сума не може бути від'ємною. Спробуйте ще раз."
        else
          result, used_coins = min_coins(coins, amount)

          if result == -1
            puts "Неможливо скласти таку суму."
          else
            puts "Мінімальна кількість монет: #{result}"
            puts "Обрані монети: #{used_coins.join('+')} = #{amount}"
          end
        end
      rescue ArgumentError
        puts "Помилка: введіть коректну числову суму."
      end
    when 2
      puts "До побачення!"
      break 
    else
      puts "Невірна опція, спробуйте ще раз."
    end
  end
end

#run
