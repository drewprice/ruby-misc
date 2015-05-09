def next_letters(str)
	str.chars.map do |i|
		case i
		when "Z"
			"A"
		when "z"
			"a"
		when /\w/
			i.next
		else
			i
		end
	end
	.join
end

def ceaser_cipher(str, key)
	key.times { str = next_letters(str) }
	return str
end

puts ceaser_cipher("What a string!", 5)