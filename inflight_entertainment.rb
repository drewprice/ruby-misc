# Passengers in-flight want to watch exactly two full movies, is it possible?

def watch_two_full_movies(flight_length, movie_lengths)

	movie_lengths.each_index do |i|
		counter = i + 1
		while counter < (movie_lengths.size)
			sum = movie_lengths[i] + movie_lengths[counter]
			return true if sum == flight_length
			counter += 1
		end
	end

	return false
end

def watch_two_full_movies_II(flight_length, movie_lengths)
	movie_lengths.each_index do |i|
		(i + 1).upto(movie_lengths.size - 1) do |j|
			sum = movie_lengths[i] + movie_lengths[j]
			return true if sum == flight_length
		end
	end

	return false
end

def watch_two_full_movies_III(flight_length, movie_lengths)
	movie_lengths.each do |movie_length|
		movie_lengths.delete(movie_length) unless movie_lengths.count(movie_length) > 1
		return true if movie_lengths.include? (flight_length - movie_length)
	end
	return false
end

puts watch_two_full_movies(186, [90,93,120,76,91,64,93,100])
puts watch_two_full_movies_II(186, [90,93,120,76,91,64,93,100])
puts watch_two_full_movies_III(186, [90,93,120,76,91,64,93,100])
