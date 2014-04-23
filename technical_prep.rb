=begin
(1..25).each do |x|
	if x % 2 == 0
		puts x
	end
end
=end

color_ary = ["red", "blue", "green", "cyan"]

if color_ary.include?("red")
	puts "this array has my favorite color"
else
	puts "ah man, this array doesn't have my fav color"
end

greeting = "hello"
name = "Chris"

if greeting == "hello" && name == "Chris"
	puts "#{greeting} #{name}"
else
	puts "Who is this?"
end

score = 91

result = case score
	when 0..60
		"F"
	when 61..70
		"D"
	when 71..80
		"C"
	when 81..90
		"B"
	when 91..100
		"A"
	else "Invalid Score"
end

puts result

fav_command = "ls"

case fav_command
	when "cd"
		puts "cd - Change Directory"
	when "rm"
		puts "rm - Remove Directory"
	when "ls"
		puts "ls - List Directory"
	else "I don't know that command"
end

(1..100).each do |x|
	if x % 3 == 0 && x % 5 == 0
		puts "FizzBuzz"
	elsif x % 3 == 0
		puts "Buzz"
	elsif x % 5 == 0
		puts "Fizz"
	else
		puts x
	end
end

