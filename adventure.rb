puts "What weapon would you like to use? (sword, gun, or kindness)"
user_input = gets.chomp
case user_input
	when "sword"
		puts "You die"
	when "gun"
		puts "Dead again"
	when "kindness"
		puts "You win!"
end
