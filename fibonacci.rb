first = 1
second = 1
i = 0
sum = 0

while i < 4000000
	i = first + second
	sum += i if i%2==0
	first = second
	second = i
end

puts sum

#can you make an array by starting with two numbers 
#and adding onto it using those numbers?  Then using 
#each to loop through array.
