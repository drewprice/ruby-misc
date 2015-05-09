def stock_picker(arr)

	potential_profits = {} # { potential_profit => [buy_day, sell_day] }
	
	arr.each_index do |buy_day|
		sell_day = arr.index(arr[buy_day...arr.length].max)
		profit = arr[sell_day] - arr[buy_day]
		potential_profits[profit] = [buy_day, sell_day]
	end

	return potential_profits.max[1]
end

print stock_picker([17,3,6,9,15,8,6,1,10])
puts