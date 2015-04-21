																	##### CLASSES AND OOP LECTURE NOTES AND USABLE EXAMPLES #####

##COVERS ALL(?) CHANGES MADE BY ED IN ORDER FROM BOTTOM TO TOP##


#### ERROR MANAGEMENT ####


							
							#### SAVE RAISE/RESCUE FOR ACTUAL ERROR CASE ####
							#### CODE I WANT TO JUMP INTO, THAT ISN'T A DEFINED ####
							#### SHOULD BE ACCESSED VIA THROW/CATCH (FASTER PREFORMANCE) ####

											#### THROW AND CATCH 2 (RAISE/RESCUE REWRITE) ####

											# begin
											# 	0.upto(10).each do |i|
											# 		puts i
											# 		10.downto(0).each do |j|
											# 			puts j
											# 			0.upto(10).each do |k|
											# 				puts k
											# 				throw :ball
											# 				end
											# 			end
											# 		end
											# 	rescue
											# 	end


											#### THROW AND CATCH ####

											# catch :ball do
											# 	0.upto(10).each do |i|
											# 		puts i
											# 		10.downto(0).each do |j|
											# 			puts j
											# 			0.upto(10).each do |k|
											# 				puts k
											# 				throw :ball
											# 				end
											# 			end
											# 		end
											# 	end


							#### SYSTEM EXIT ERROR ####
							## WOULD PREVENT EXITS (WOULD YOU LIKE TO SAVE?)
							# begin
							# 	exit 										#=> SystemExit ERROR
							# rescue SystemExit		
							# 	puts "NOT SO FAST"
							# end
							# puts "I'm still good"


							#### 0 DIVISION ERROR ####

							# begin
							# 	1/0												#=> ZeroDivisionError
							# rescue ZeroDivisionError
							# 	puts "I can't divide by 0"
							# end


							#### RESCUE WITH LONG METHOD CHAINS ####

							# def a
							# 	b
							# end

							# def b
							# 	c
							# end

							# def c
							# 	d
							# end

							# def d
							# 	raise "BOOM"
							# end

							# begin
							# 	a
							# rescue => e
							# 	puts "RESCUE - BACKTRACE: #{e.backtrace}"
							# end

							# puts "IM STILL RUNNING"


							##### BACKTRACES #####

							def add_two(number)
								if not number.respond_to? :+
									raise ArgumentError, "Invalid Argument Error"
								elsif 
									number == 0
									raise "ZERO ERROR"
								end
							end


							begin
								# puts add_two({})								#=> RESCUE will not allow block to continue
								puts add_two(0)										 
								rescue ArgumentError => e  				#=>passes ArgumentError as variable "e"
									p e, e.class 						
									puts "RESCUED: #{e.message}"	
								rescue => e 											#=>
									p "WTF?! Rescue => e activated - #{e.class}: #{e.message}"
									p e.backtrace										#=>
							end 	

							#### RESCUES ####

							# def add_two(number)
							# 	if not number.respond_to? :+
							# 		raise ArgumentError, "Invalid Argument Error"
							# 	elsif 
							# 		number == 0
							# 		raise "ZERO ERROR"
							# 	end
							# end

							# begin
							# 	puts add_two({}) 						
							# 	rescue ArgumentError		#=> rescues all ArgumentErrors that occur							
							# 		puts "RESCUED"	
							# 	puts add_two(0)					#=> ERROR: ZERO ERROR
							# end 	

							#### RESCUES #####
							# def add_two(number)
							# 	if not number.respond_to? :+      
							# 		raise "INVALID ARGUMENT"
							# 	end
							# 	number + 2
							# end

							# begin
							# 	puts_two({}) 						#=> would raise ERROR:INVALID ARGURMENT
							# 	rescue 									#=> and break at this point
							# 	puts "RESCUED"					#=> however rescue allows a continuation of 
							# end 											#=> code execution past error


							#### RAISE WILL STOP (BREAK) CODE ####

							# def add_two(number)
							# 	if not number.respond_to? :+      #=> if not can be replaced by unless
							# 		raise "INVALID ARGUMENT"
							# 	end
							# 	number + 2
							# end

							# p add_two(2)						#=> Doesn't raise error
							# p add_two({})						#=> ERROR: INVALID ARGUMENT
							# p "Error"								#=> not run, due to raise above


							#### RAISE METHOD (FOR CUSTOM ERRORS) ####

							# #### RAISE WILL STOP (BREAK) CODE ####

							# class Table
							# 	attr_accessor :num_legs

							# 	def initialize (num_legs)
							# 		if num_legs > 0							
							# 			@num_legs = num_legs 			
							# 		else
							# 			raise	"Invalid number of legs."			#=> From Kernel, raise takes string
							# 		end 																	#=> and returns in ERROR message
							# 	end
							# end

							# table = Table.new(-1)											#=> returns ERROR: in 'initialize'
							# p table.num_legs 													#=> Invalid number of legs	


							#### THERE WOULDN'T BE NEGATIVE LEGS ####

							# class Table
							# 	attr_accessor :num_legs

							# 	def initialize (num_legs)
							# 		if num_legs > 0							#=> checks to see if there are more
							# 			@num_legs = num_legs 			#=> 0 legs
							# 		else
							# 			@num_legs = 4							#=> if legs <=0, sets default
							# 		end
							# 	end
							# end

							# table = Table.new(-1)
							# p table.num_legs 								#=> returns 4, not -1


#### PRIVACY & PROTECTION ####

							#### ARGUMENTS IN METHODS #####

							# class Person
							# 	def speak(what_to_say)						#=>add argument to change result
							# 		puts what_to_say
							# 	end
							# end

							# class Parent < Person
							# 	def speak 						
							# 		super "- SUPER EXTRA TEXT"		#=> pulls method from ancestor (and inserts argument as required)
							# 	end
							# end

							# p = Parent.new
							# puts p.speak

							#### EMBRACE AND EXTEND ####

							# class Person
							# 	def speak
							# 		"I'm a Person who is speaking"
							# 	end
							# end

							# class Parent < Person
							# 	def speak 						
							# 		super + "- SUPER EXTRA TEXT"		#=> pulls method from ancestor (can be altered as demonstrated)
							# 	end
							# end

							# p = Parent.new
							# puts p.speak


							#### METHOD SCOPE ####

							# class Person
							# 	def speak
							# 		"I'm a Person who is speaking"
							# 	end
							# end

							# class Parent < Person
							# 	def speak 						#creates infinite loop, as method is calling itself
							# 		speak
							# 	end
							# end

							# p = Parent.new
							# puts p.speak 						#=> stack overflow error


							#### Parent / Child Relationship - Method hierarchy ####

							# class Parent
							# 	def whoami
							# 		puts "Im a parent"
							# 	end
							# end

							# class Child < Parent
							# 	def whoami				#=> overwrites less specific (ancestor/inherited) whoami method of Parent
							# 		"I'm a child"
							# 	end
							# end

							# c = Child.new
							# p c.whoami					#=> "I'm a child"

							#### Parent / Child Relationship ####

							# class Parent
							# 	def whoami
							# 		puts "Im a parent"
							# 	end
							# end

							# class Child < Parent
							# end

							# p c = Child.new
							# c.whoami					#=> "I'm a parent"


							#### private = me and my decedents (most secure) ####
							#### protected = can be shared within ancestor chain (less secure than protected) ####

							# class Parent
							# 	private
							# 	def a_private_method
							# 		puts "PRIVATE"
							# 	end

							# 	protected 
							# 	def a_protected_method
							# 		puts "PROTECTED"
							# 	end
							# end

							# class Child < Parent
							# 	def a_public_method
							# 		a_protected_method
							# 		puts "CHILD - PROTECTED"
							# 	end

							# 	def family_secret(other_child)
							# 		puts "Family secret"
							# 		other_child.a_protected_method
							# 	end
							# end

							# 		# p c = Child.new
							# 		# p c.a_public_method
							# 		# p c.a_private_method
							# 		# p c.a_protected_method

							# p c1 = Child.new
							# p Child.ancestors						#=>ancestors can be passed protected info
							# p c2 = Child.new
							# p c1.family_secret(c2)


							#### WHY USE A PRIVATE METHOD WHEN IT ISN'T TRULY "PRIVATE"? ####
							#### NOT FOR SERIOUS SECURITY TECHNIQUE, MORE FOR ANTI-CODERS ####
							# class BankTransfer
							# 	def transfer
							# 		puts "transfer - withdraw"
							# 		withdraw
							# 		puts "transfer - deposit"
							# 		deposit
							# 	end

							# 	private
							# 	def withdraw
							# 		puts "withdraw"
							# 	end

							# 	def deposit
							# 		puts "deposit"
							# 	end
							# end

							# bt = BankTransfer.new
							# p bt
							# p bt.transfer
							# #p bt.withdraw									#=> private method ERROR
							# #p bt.deposit										#=> private method ERROR
							# p bt.send :transfer
							# p bt.send :deposit


							#### Using .send to bypass privacy ####

							# class Table
							# 	def a_public_method
							# 		puts "Public method"
							# 	end

							# 	private 									
							# 	def a_private_method
							# 		puts "Private method"
							# 	end
							# end

							# t = Table.new
							# t.a_public_method
							# t.send :a_private_method			#=> reveals a_private_method	


							#### HOW TO REVEAL A PRIVATE METHOD ####

							# class Table
							# 	def a_public_method
							# 		puts "Public method"
							# 		a_private_method				#=> to reveal a_private_method
							# 	end

							# 	private 									
							# 	def a_private_method			
							# 		puts "Private method"
							# 	end
							# end

							# t = Table.new
							# t.a_public_method						#=> a_private_method is effectively called via a_public_method


							#### HOW TO SET PRIVATE METHOD ####

							# class Table
							# 	def a_public_method
							# 		puts "Public method"
							# 	end

							# 	private 									#=> Anything between private / end will not be publicly available
							# 	def a_private_method			#=> This can only be called
							# 		puts "Private method"
							# 	end
							# end

							# t = Table.new
							# t.a_public_method


#### CLASS VARIABLES - CREATE A METHOD TO ASSIGN SERIAL NUMBERS TO EACH Table.new ####

							# class Table 																
									
							# 		attr_accessor :id

							# 		@@next_table_id = 1					

							# 		def self.next_table_id		#added self to method to return variable#
							# 				@@next_table_id
							# 		end

							# 		def initialize
							# 			@id = @@next_table_id
							# 			@@next_table_id += 1
							# 		end
									
							# 		def preview_next_table_id
							# 			@@next_table_id
							# 		end

							# 		def change_next_table_id(next_id) 			#could be an issue, if nil or other value is passed
							# 			@@next_table_id = next_id
							# 		end

							# 		def put_on(something)
							# 			@tabletop << something
							# 		end

							# 		def look_at
							# 			@tabletop
							# 		end

							# 	end

							# 	a = Table.new      										#=> @id = 1
							# 	p a
							# 	p a.id
							# 	b = Table.new 		 										#=> @id = 2
							# 	p b
							# 	p b.id
							# 	p b.preview_next_table_id							#=> 3
							# 	p b.change_next_table_id(10000)				#=> 100000
							# 	p b.preview_next_table_id							#=> 100000
							# 	t2 = Table.new
							# 	p t2.id 															#=> 100000

							## @ = 2 tabs in, @@ = 1 tab in, and below ##

							# class Table 									
							# 		attr_reader: @id							

							# 		@@next_table_id = 1					

							# 		def self.next_table_id		
							# 				@@next_table_id
							# 			end

							# 		def initialize
							# 			@id = @@next_table_id
							# 			@@next_table_id += 1
							# 		end

							# 		def put_on(something)
							# 			@tabletop << something
							# 		end

							# 		def look_at
							# 			@tabletop
							# 		end

							# 	end

							# 	p a = Table.new      #=> @id = 1
							# 	p a
							# 	p b = Table.new 		 #=> @id = 2
							# 	p b



							#### add self to method, implement counter ####

							# class Table 									
																		
							# 		attr_accessor :num_legs

							# 		@@next_table_id = 1					

							# 		def self.next_table_id		#added self to method to return variable
							# 				@@next_table_id
							# 			end

							# 		def initialize 
							# 			@tabletop = []
							# 			@id = @@next_table_id		#added @id method variable to log @@next_table_id more locally
							# 			@@next_table_id += 1		#increments @@next_table_id by 1 
							# 		end

							# 		def self.has_legs?
							# 			true
							# 		end

							# 		def put_on(something)
							# 			@tabletop << something
							# 		end

							# 		def look_at
							# 			@tabletop
							# 		end

							# 	end

							# 	a = Table.new
							# 	p a


							##SYNTAX ERRORR##
								# class Table 									#recreates class Table (partially copied from below examples)
										
										# def next_table_id					#creates method to "view" variable (will error below)
										# 	@@next_table_id
										# end
														
								# 	attr_accessor :num_legs

								# 	def initialize
								# 	end

								# 	def put_on(something)
								# 		@tabletop << something
								# 	end

								# 	def look_at
								# 		@tabletop
								# 	end

								# 	@@next_table_id = 1					#new variable created

								# end

								# #p Table.@@next_table_id 			=> syntax error (@ or @@ is a "secret")
								# #p Table.next_table_id				=> syntax error


## OOP Thinking ##
			##From the perspective of the Table, what type of addition should I##
					##be concerned about? Problem is oriented around an object##

								# class Table

								# 	attr_accessor :tabletop

								# 	def initialize
								# 		@tabletop = []
								# 	end

								# 	def add (item)
								# 		@tabletop.push(item)
								# 	end

								# end

			##Functional design:
				## add(something, something) ##
				## What if something is a Table? ##

			##OOP design:
				## object.add(something) or object.method(argument, argument) ##
				## Does object care if something is a Table? ##


			## OOP - only solve potential problems that are necessary to maintain class ##
			## Everytime you call a method, it is oriented around an object (even if its Kernel) ##


## CREATE A METHOD THAT DOESN'T BREAK FOR AS MANY TYPES OF DATA AS POSSIBLE ##
	##THINKING FUNCTIONALLY##

					# def add(left, right)
					# 		if String, String.concat
					# 		if Array, Array.concat
					# 		if Nil or Hash, ERROR
					# 		if anthiny thats not a number, ERROR
					# 		Uless its relayed to a number
					# 		Unless it knows how to add some other way
					# 	else
					# 		left + right
					# 	end


## MIXINS ##
	###FEATURES(MODULES) TO ADD TO CLASS ITEMS###

					# class Vehicle
					# 	attr_accessor :engine, :tires
					# end

					#  class Car < Vehicle
					# 		module Talkative
					# 			def speak
					# 				puts "Hello WORLD"
					# 			end
					# 		end
					#  end

					# class Kitt < Car   				#inherit features from Car class
					# 	include Talkative				#More or less copy/pastes speak method to Kitt class
					# end
					
					# p Kitt.ancestors					#introspection
					# p Kitt.class 							#introspection
					# p Kitt.superclass 			  #next class level upriver

					# kitt = Kitt.new 					#creates new object "kitt" of Class = Kitt
					# kitt.speak								#demonstrates calling of included method Car>Talkative>Speak

					# # class Motorcycle < Vehicle
					# # 	end


## CREATE ANOTHER CLASS VEHICLE (SUPERCLASS: THE IMMEDIATE PARENT) AND LINK CAR/MOTORCYCLE ##

					# class Vehicle
					# 	attr_accessor :engine, :tires
					# end

					# class Car < Vehicle
					# end

					# class Motorcycle < Vehicle
					# 	end

					# p Car.ancestors
					# p Car.superclass
					# p Motorcycle.ancestors
					# p Motorcycle.superclass

					# my_car = Car.new
					# p my_car.engine						# => Nil because none input, but nil isn't ERROR
					# p my_car.tires						# => Nil because none input, but nil isn't ERROR 


##NOTICE REPEATED ATTRIBUTE CODE, REDUNDANT##

					# class Car
					# 	attr_accessor :engine, :tires
					# end

					# class Motorcycle
					# 	attr_accessor :engine, :tires
					# end


##CREATE MY_CAR AND SEE AVAILABLE OPTIONS (INTROSPECTION)##

					# class Car
					# 	end
					# p Car.class, Car.methods

					# my_car = Car.new
					# p my_car.class, my_car.methods, my_car.methods.size


##CREATE CLASS AND SEE AVAIABLE OPTIONS (INTROSPECT)##
					
					# class Car
					# 	end
					# p Car.class, Car.methods, Car.ancestors


##CREATE HAS_LEGS? METHOD##

					# class Table
						
					# 	attr_accessor :num_legs

					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def self.has_legs?
					# 		true
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# end

					# a_table = Table.new(5)   
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs
					# p a_table.num_legs = 3
					# p Table.has_legs?							#returns true/false


##ATTR_ACCESSOR IN CORRECT LOCATION##

					# class Table
						
					# 	attr_accessor :num_legs

					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# end

					# a_table = Table.new(5)   
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs
					# p a_table.num_legs = 6					


##ATTR_ACCESSOR METHOD##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# 	# attr_reader :num_legs 

					# 	# attr_writer :num_legs

					# 	attr_accessor :num_legs         #replaces both reader/writer methods - USUALLY LOCATED BEFORE INITIALIZE

					# end

					# a_table = Table.new(5)            
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs
					# p a_table.num_legs = 6					


##ATTR_WRITER METHOD##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# 	attr_reader :num_legs 
						
					# 	# def change_legs(num_legs)
					# 	# 	@num_legs = num_legs
					# 	# end

					# 	attr_writer :num_legs           #replaces above commented code -  notice : - allows for write privelages

					# end

					# a_table = Table.new(5)            #num_legs arg
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs
					# p a_table.num_legs = 6						#to pass writer variables new values


##CHANGE LEGS? DEFINE NEW METHOD##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# 	attr_reader :num_legs 
						
					# 	def change_legs(num_legs)
					# 		@num_legs = num_legs
					# 	end

					# 	#attr_writer :num_legs

					# end

					# a_table = Table.new(5)  
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs
					# p a_table.change_legs(4)
					

##ATTR_READER METHOD##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# 	# def method num_legs
					# 	# 	@num_legs
					# 	# end

					# 	attr_reader :num_legs      #replaces above commented code -  notice : - provides READ ability

					# end

					# a_table = Table.new(5)       
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.num_legs


##NUM_LEGS appears when you call p a_table##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 		@num_legs = num_legs
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end

					# 	def method num_legs
					# 		@num_legs
					# 	end

					# end

					# a_table = Table.new(5)        
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table


##HOW MANY LEGS? - NOT A SET VALUE (COULD BE VARIABLE)##
	## ADD AN ARGUMENT TO INITIALIZE METHOD##
	## WHEN ARGUMENT IS ADDED, ARGUMENT MUST BE INCLUDED IN .NEW CALL##

					# class Table
					# 	def initialize (num_legs)
					# 		@tabletop = []
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end
					# end

					# a_table = Table.new(5)        #num_legs arg
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table


##HOW TO VIEW @TABLETOP?##

					# class Table
					# 	def initialize
					# 		@tabletop = []
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.look_at						#=> effectively shows @tabletop

					# p @tabletop 								#=> nil


##INITIALIZE METHOD - RUBY SPECIFIC - ##
	##CREATES @TABLETOP ONCE PER EACH TABLE.NEW CALL##

					# class Table
					# 	def initialize
					# 		@tabletop = []
					# 	end

					# 	def put_on(something)
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# a_table.put_on 2
					# p a_table.look_at


##1 DOESNT HOLD WHEN 2 IS ADDED##
	## @TABLETOP IS RECREATED FOR EACH TIME PUT_ON IS CALLED##

					# class Table
					# 	def put_on(something)
					# 		@tabletop = []
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# #p a_table.look_at
					# a_table.put_on 2
					# p a_table.look_at


## USING THE @ CREATES AN "INSTANCE VARIABLE" (ONLY AVAILABLE IN THE INSTANCE [CLASS])

					# class Table
					# 	def put_on(something)
					# 		@tabletop = []
					# 		@tabletop << something
					# 	end

					# 	def look_at
					# 		@tabletop
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# p a_table.look_at


##tabletop variable isn't continuing to look_at##

					# class Table
					# 	def put_on(something)
					# 		tabletop = []
					# 		tabletop << something
					# 	end

					# 	def look_at
					# 		tabletop
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# p a_table.look_at


##DOESNT RETURN 1 when PUT_ON IS CALLED##

					# class Table
					# 	def put_on(something)
					# 		[] << something
					# 	end

					# 	def look_at
					# 		[]
					# 	end
					# end

					# a_table = Table.new
					# a_table.put_on 1
					# p a_table
