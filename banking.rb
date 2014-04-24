class Person
	attr_reader :name, :cash
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi #{name}, you have $#{cash}."
	end
end

class Bank
	attr_reader :bank, :bank_balance
	def initialize(bank)
		@users = Hash.new
		@bank = bank
		@bank_balance = 0
		puts "#{bank} bank has been created."
	end
	def open_account(person)
		@users[person.name] = 0
		puts "#{person.name}, thanks for opening an account at #{bank}."
	end
	def deposit(person, amount)
		if person.cash < amount
			puts "#{person.name} doesn't have enough cash to deposit $#{amount}."
		else
			@users[person.name] += amount
			person.cash -= amount
			@bank_balance += amount
			puts "#{person.name} deposited $#{amount} to #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s #{bank} account has $#{@users[person.name]}."
		end
	end
	def withdraw(person, amount)
		if @users[person.name] < amount
			puts "#{person.name} doesn't have enough money in the account to withdraw $#{amount}."
		else
			@users[person.name] -= amount
			person.cash += amount
			@bank_balance -= amount
			puts "#{person.name} withdrew $#{amount} from #{bank}. #{person.name} has $#{person.cash}. #{person.name}'s #{bank} account has $#{@users[person.name]}."
		end 
	end
	def transfer(person, other_bank, amount)
		@users[person.name] -= amount #need this for other_bank, not tracking other_bank account balance at the moment (only total balance)
		@bank_balance -= amount
		other_bank.bank_balance += amount
		puts "#{person.name} transferred $#{amount} from #{bank} to #{other_bank.bank}. #{bank} account has $#{@users[person.name]} and #{other_bank.bank} account has $#{other_bank.bank_balance}."
	end
	def total_cash_in_bank
		puts "#{bank} has $#{bank_balance} in the bank."
	end
end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Chris", 500)
friend1 = Person.new("John", 1000)
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
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank


