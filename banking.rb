class Person
	attr_reader :name, :ssn 
	attr_accessor :cash
	def initialize(name, ssn, cash)
		@name = name
		@ssn = ssn
		@cash = cash
		puts "Hi #{name}, you have $#{cash}."
	end
end

class Bank
	attr_reader :bank_name
	attr_accessor :bank_balance
	def initialize(bank_name)
		@users = Hash.new
		@bank_name = bank_name
		@bank_balance = 0
		puts "#{bank_name} bank has been created."
	end
	def open_account(person)
		@users[person.ssn] = 0
		puts "#{person.name}, thanks for opening an account at #{bank_name}."
	end
	def deposit(person, amount)
		if person.cash < amount
			puts "#{person.name} doesn't have enough cash to deposit $#{amount}."
		else
			@users[person.ssn] += amount
			person.cash -= amount
			@bank_balance += amount
			puts "#{person.name} deposited $#{amount} to #{bank_name}. #{person.name} has $#{person.cash}. #{person.name}'s #{bank_name} account has $#{@users[person.ssn]}."
		end
	end
	def withdraw(person, amount)
		if @users[person.ssn] < amount
			puts "#{person.name} doesn't have enough money in the account to withdraw $#{amount}."
		else
			@users[person.ssn] -= amount
			person.cash += amount
			@bank_balance -= amount
			puts "#{person.name} withdrew $#{amount} from #{bank_name}. #{person.name} has $#{person.cash}. #{person.name}'s #{bank_name} account has $#{@users[person.ssn]}."
		end 
	end

	def transfer(person, other_bank, amount)
		withdraw(person, amount)
		other_bank.deposit(person, amount)
		puts "#{person.name} transferred $#{amount} from #{bank_name} to #{other_bank.bank_name}. #{bank_name} account has $#{@users[person.ssn]} and #{other_bank.bank_name} account has $#{other_bank.bank_balance}."
	end
	def total_cash_in_bank
		puts "#{bank_name} has $#{bank_balance} in the bank."
	end
end

class CreditCard
	attr_accessor :credit_limit

	def initialize(person, bank, credit_limit)
		@credit_limit = credit_limit
		puts "#{person.name} has a #{bank.bank_name} credit card with a $#{@credit_limit} credit limit."
	end

	def charge_card(person, bank, amount)
		@credit_limit -= amount
		if amount > @credit_limit
			puts "#{person.name} does not have enough credit for this purchase."
		else
			puts "#{person.name} has $#{@credit_limit} remaining credit on the #{bank.bank_name} card."
		end
	end

	def pay_card(person, bank, amount)
		@credit_limit += amount
		puts "#{person.name} has $#{@credit_limit} remaining credit on the #{bank.bank_name} card."
	end
end


chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Chris", 123, 500)
friend1 = Person.new("John", 456, 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
chase.transfer(me, wells_fargo, 100)
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
chase.total_cash_in_bank
wells_fargo.total_cash_in_bank

wells_credit = CreditCard.new(me, wells_fargo, 5000)
wells_credit.charge_card(me, wells_fargo, 1000)
wells_credit.pay_card(me, wells_fargo, 200)
wells_credit.charge_card(me, wells_fargo, 8000)


