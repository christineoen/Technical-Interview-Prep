class Person
	attr_reader :name, :cash
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi #{name}, you have $#{cash}."
	end
end

class Bank
	attr_reader :name, :bank, :other_bank
	attr_accessor :amount
	def initialize(bank)
		@name = name
		@bank = bank
		@other_bank = other_bank
		@amount = amount
		puts "#{bank} bank has been created."
	end
	def open_account(name)
		puts "You have opened a new account under the name #{name}"
	end
	def withdraw_cash(amount)
		puts "You have withdrawn $#{amount}."
	end
	def deposit_money(amount)
		puts "You have deposited $#{amount}."
	end
	def transfer_money(amount, other_bank)
		puts "You have transferred $#{amount} to #{other_bank}."
	end
end
