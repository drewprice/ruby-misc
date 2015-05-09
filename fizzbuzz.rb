1.upto(100) do |n|
	fizzy = (n % 3 == 0)
	buzzy = (n % 5 == 0)

	print n unless fizzy || buzzy
	print "fizz" if fizzy
	print "buzz" if buzzy

	puts # line break
end