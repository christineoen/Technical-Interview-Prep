class Person
	attr_reader :name, :cash
	def initialize(name, cash)
		@name = name
		@cash = cash #create hash here?
		puts "Hi #{name}, you have $#{cash}."
	end
end

class Bank
	attr_reader :bank
	def initialize(bank)
		@users = Hash.new
		@user_cash = Hash.new(0) #probably not correct
		@bank = bank
		puts "#{bank} bank has been created."
	end
	def establish_cash #probably not correct
		@user_cash[person.name] = person.cash
	end
	def open_account(person)
		@users[person.name] = 0
		puts "#{person.name}, thanks for opening an account at #{bank}."
	end
	def deposit(person, amount)
		@users[person.name] += amount
		@user_cash[person.name] -= amount #not working
		puts "#{person.name} deposited $#{amount} to #{bank}. #{person.name} has $#{person.cash}. #{bank} has $"
	end
	def withdraw(person, amount)
		@users[person.name] -= amount
		@user_cash[person.name] += amount #not working
		puts "#{person.name} withdrew $#{amount} from #{bank}. #{person.name} has $#{person.cash}. #{bank} has $"
	end
	def transfer(person, other_bank, amount)
		@users[person.name] -= amount
		other_bank.deposit(person, amount) #need to rewrite so it doesn't print out the deposit statement
		puts "#{person.name} transferred $#{amount} from #{bank} to #{other_bank.bank}."
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

