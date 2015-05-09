# PROMPT
	# Create a bubble_sort_by which sorts an array but accepts a block.
	# -- The block should take two arguments which represent the two elements currently being compared.
	# -- Expect that the block's return will be similar to the spaceship operator:
	#    - If the result of the block is negative, the element on the left is "smaller" than the element on the right.
	# 	 - 0 means they are equal.
	#    - A positive result means the left element is greater.
	# -- Use this to sort the array.

def bubble_sort_by(arr, &block)
	stop_sorting = false
	
	until stop_sorting
		stop_sorting = true # hopeful
		
		arr.each_index do |i|
			break if i == arr.length - 1 # don't look beyond existing array
			
			result = block.call(arr[i], arr[i + 1])
			
			if result < 0
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				stop_sorting = false
			end
		end
	end
	
	arr
end

print (bubble_sort_by(["hi", "hello", "hey"]) { |left,right| right.length - left.length })
puts