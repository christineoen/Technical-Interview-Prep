sum_square = 0
(1..100).each do |x|
	sum_square += x**2
end

square_sum = 0
sum = 0
(1..100).each do |x|
	sum += x
	square_sum = sum**2
end

puts square_sum - sum_square