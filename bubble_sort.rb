def bubble_sort(arr)
	change_count = 1
	until change_count < 1
		change_count = 0
		arr.each_index do |i|
			break if i == arr.length - 1 # don't look beyond what exists
			if arr[i] > arr [i + 1]
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				change_count += 1
			end
		end
	end
	arr

end

print bubble_sort([5,3,9,33,15,2,1,6,1])
puts

print bubble_sort([4,3,78,2,0,2])
puts