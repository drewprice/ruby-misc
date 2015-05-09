def substring(str, dictionary)
	incoming_words = str.downcase.scan(/\w+\S?\w+/)
	temp_dictionary = []

	incoming_words.each do |word|
		word.chars.each_index do |i|
			substr = word[i..-1] # begin with longest possible substring
			until substr.length < 1
				temp_dictionary << substr if dictionary.include? substr
				substr = substr[0...-1] # remove last character from substring
			end
		end
	end

	words_and_counts = {}

	temp_dictionary.each do |word|
		words_and_counts[word] = temp_dictionary.count(word)
	end


	return words_and_counts
end

current_dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substring("below", current_dictionary)
puts

print substring("Howdy partner, sit down! How's it going?", current_dictionary)
puts