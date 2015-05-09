def stock_picker(arr)
	greatest_profits = {} # { buy_day => [profit, sell_day] }

	arr.each_with_index do |buy_price, buy_day|
		first_sell_day = buy_day + 1
		final_sell_day = arr.length - 1
		
		best_profit = 0
		best_sell_day = nil

		first_sell_day.upto(final_sell_day) do |sell_day|
			sell_price = arr[sell_day]
			possible_profit = sell_price - buy_price
			
			if possible_profit > best_profit
				best_profit = possible_profit
				best_sell_day = sell_day
			end
		end

		greatest_profits[buy_day] = [best_profit, best_sell_day]
	end

	winner = greatest_profits.max_by { |buy_day, sell_info| sell_info[0] } # => largest profit as [buy_day [profit, sell_day]]
	buy_it = winner[0]
	sell_it = winner[1][1]

	return [buy_it, sell_it]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])