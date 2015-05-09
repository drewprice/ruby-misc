module Enumerable

	def my_each(&block)
		counter = 0
		while counter < self.length
			yield(self[counter])
			counter += 1
		end
		self
	end

	def my_each_with_index(&block)
		counter = 0
		while counter < self.length
			yield(self[counter], counter)
			counter += 1
		end
		self
	end

	def my_select(&block)
		selected = []
		self.my_each do |i|
			if yield(i)
				selected << i
			end
		end
		return self if selected.empty?
		selected
	end

	def my_all?(&block)
		self.my_each do |i|
			return false unless yield(i)
		end
		true
	end

	def my_any?(&block)
		self.my_each do |i|
			return true if yield(i)
		end
		false
	end

	def my_none?(&block)
		self.my_each do |i|
			return false if yield(i)
		end
		true
	end

	def my_count(arg="nil...ish", &block)
		# no argument (arg=="nil...ish", which allows nil as arg) & no block => length
		# arg only => count of arg
		# block => count where true

		return self.size if (arg == "nil...ish" && !block_given?)

		if arg != "nil...ish" && block_given?
			puts "warning: given block not used"
			block = nil
		end

		counted = 0			
		self.my_each do |i|
			counted += 1 if (i == arg) || (!block.nil? && yield(i))
		end
		counted
	end

	def my_map(&block)
		mapped = []
		self.my_each do |i|
			mapped << yield(i)
		end
		mapped
	end
	
	def my_inject(memo=0)
		self.to_a.my_each do |i|
			memo = yield(memo, i)
		end
		memo
	end
end

def multiply_elements(arr)
	arr.my_inject(1) { |product, n| product * n }
end


# TEST

	arr = (1..5).to_a

	puts "Expect: #my_each"
	print arr.my_each { |n| puts n }
	puts
	puts "----\n"

	puts "Expect: #my_each_with_index"
	print arr.my_each_with_index { |n, i| puts "#{n} is at #{i}" }
	puts
	puts "----\n"

	puts "Expect: #my_select'ed array"
	print arr.my_select { |n| n > 3 }
	puts
	puts "----\n"

	puts "Expect: #my_select original array"
	print arr.my_select { |n| n + 2 }
	puts
	puts "----\n"

	puts "Expect: true"
	print arr.my_all? { |n| n.is_a? Fixnum }
	puts
	puts "----\n"

	puts "Expect: false"
	print arr.my_all? { |n| n.is_a? String }
	puts
	puts "----\n"

	puts "Expect: true"
	print arr.my_any? { |n| n > 2 }
	puts
	puts "----\n"

	puts "Expect: true"
	print arr.my_none? { |n| n.is_a? String }
	puts
	puts "----\n"

	puts "Expect: false"
	print arr.my_none? { |n| n > 2 }
	puts
	puts "----\n"

	puts "Expect: 2"
	print arr.my_count { |n| n > 3 }
	puts
	puts "----\n"

	puts "Expect: 1"
	print arr.my_count(3)
	puts
	puts "----\n"

	puts "Expect: 5"
	print arr.my_count
	puts
	puts "----\n"

	puts "Expect: 5"
	print arr.my_count { |n| n + 3 }
	puts
	puts "----\n"

	puts "Expect: 1 w/ warning"
	print arr.my_count(1) { |n| n > 3 }
	puts
	puts "----\n"

	puts "Expect: 1"
	arr << nil
	print arr.my_count(nil)
	arr.pop
	puts
	puts "----\n"

	puts "Expect: #my_map'ped array, with original array unchanged"
	print arr.my_map { |n| n + 2 }
	puts
	print arr
	puts
	puts "----\n"

	puts "Expect: 15"
	print arr.my_inject { |sum, n| sum + n }
	puts
	puts "----\n"

	puts "Expect: 40"
	puts multiply_elements([2,4,5])
	puts "----\n"

	puts "Expect: doubled array"
	double = Proc.new { |n| n * 2 }
	print arr.my_map(&double)
	puts
