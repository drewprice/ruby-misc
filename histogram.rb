puts "Text please:"
text = gets.chomp.downcase

words = text.scan(/\w+\S?\w+/)

histogram = {}

words.each do |i|
	histogram[i.to_sym] = words.count(i)
end

histogram.sort.each { |word,count| puts "#{word}: #{count}" }