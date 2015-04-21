#usable_examples.rb
###THE FOLLOWING IS A SCROLL OF USABLE AND ANNOTATED CODE EXAMPLES####


#######!!!!!!DO NOT DELETE ANYTHING BELOW!!!!!#########


###DO NOT DELETE!!!###
















#### Create your own error class. Make it a subclass of StandardError ####
              #### and show some code that uses it. ####

              # class NoData < StandardError
              #    def initialize
              #     puts "No Data - NoData custom error activated"
              #    end
              # end

              # def has_data(data)
              #   if data[0].class == NilClass
              #     raise NoData
              #   else
              #     puts "HAS DATA, NO ERROR"
              #   end
              # end

              # data1 = [1]
              # data2 = []
              # data3 = [3]

              # begin
              #   system "clear"
              #   puts "\n\nBegin test...."
              #   sleep(1)
              #   print "\nNoData error ancestors: ",NoData.ancestors,"\n\n"
              #   sleep(2)
              #   has_data(data1)
              #   sleep(2)
              #   puts "\n\n"
              #   has_data(data2)
              #   sleep(2)
              #   rescue
              #     puts "Rescued"
              #   puts "\n\n"
              #   sleep(2)
              #   has_data(data3)
              # end


#### REPLACE PUTS / P COMMANDS IN A CLASS ####

              #### TAKE TWO ####
              # class MyClass < Object
              # end

              # class Object
              #   def inspect
              #     "MyClass.new - caught Object.inspect method"
              #   end
              #   def to_s
              #     "MyClass.new - caught Object.to_s method"
              #   end
              # end

              # p MyClass.new
              # puts MyClass.new

              #### ORIGINAL ATTEMPT ####
              # ### The puts method calls an object’s to_s method. ####
              # ### The p met#### hod calls an object’s inspect method. ####

              # ### Define a type of object that responds to puts and p. ####

              # ### puts MyClass.new (and) p MyClass.new ####
              # ### should both return a nice, readable string. ####

              # class MyClass
              # end

              # def puts(arg)
              #   Kernel.puts "Puts MyClass.new"
              # end

              # def p(arg)
              #   Kernel.puts "Ps MyClass.new"
              # end


              # puts MyClass.new
              # p MyClass.new


#### CLASSIFY MULTIPLE QUADRILATERALS (TRAIT INHERITANCE) ####
            #### A quadrilateral is any four-sided shape. A rectangle, square, rhombus, and trapezoid ####
            #### are all types of quadrilaterals. A square is a type of rectangle. A rhombus is a type of trapezoid. #####
            #### Model this concept in Ruby using classes and inheritance. #####
            #### Use TDD to confirm that all of your classes are working correctly. ####


            # class Quadrilateral
            # end

            # class Rectangle < Quadrilateral
            # end

            # class Square < Rectangle
            # end

            # class Trapezoid < Quadrilateral
            # end

            # class Rhombus < Trapezoid
            # end

            # def test
            #   squa = Square.new
            #   puts squa.is_a? Rectangle
            #   puts squa.is_a? Quadrilateral

            #   rect = Rectangle.new
            #   puts rect.is_a? Quadrilateral
            #   puts not(rect.is_a? Trapezoid)

            #   rhom = Rhombus.new
            #   puts rhom.is_a? Quadrilateral
            #   puts rhom.is_a? Trapezoid

            #   trap = Trapezoid.new
            #   puts trap.is_a? Quadrilateral
            #   puts not(trap.is_a? Rhombus)
            # end

            # test


#### SELF IN AN OBJECT, CLASS, METHOD, AND METHOD-IN-CLASS ####

            # print "SELF:",self.class,"\n"

            # class Class1
            #   print "CLASS:",self.class,"\n"
            # end

            # Class1.new

            # def method1
            #   print "METHOD:",self,"\n"
            # end

            # method1

            # class Class2
            #   def method2
            #     print "METHOD IN CLASS:",self.class,"\n"
            #   end
            # end

            # a = Class2.new
            # a.method2


##### Write just enough code to make this line of Ruby not return an error: ######
      ### quick_fox.jumped_over(lazy_dog, daisy_log)###
      
            # class Class1
            #   def jumped_over(arg1,arg2)
            #   end
            # end

            # def lazy_dog
            # end

            # def daisy_log
            #   end

            # quick_fox = Class1.new
            # quick_fox.jumped_over(lazy_dog, daisy_log)


####### CHANGE DEFAULT OBJECT METHODS (p) IN CLASS #########
            # class MyClass
            #   def puts(arg)
            #     Kernel.puts arg.to_s
            #   end
              
            #   def p(arg)
            #     Kernel.puts arg.to_s
            #   end
            # end


            # a = MyClass.new

            # a.puts("Hello")
            # puts ("Hello")

            # a.p("Hello")        #=> Different output from below, showing class variable priority
            # p("Hello")


####### CLASSES & OOP EXAMPLES #########
  #####CLASSES - READ BOTTOM-TO-TOP FOR FLOW#####
      #### PRIVACY & PROTECTION ####

              #### ARGUMENTS IN METHODS #####

              # class Person
              #   def speak(what_to_say)            #=>add argument to change result
              #     puts what_to_say
              #   end
              # end

              # class Parent < Person
              #   def speak             
              #     super "- SUPER EXTRA TEXT"    #=> pulls method from ancestor (and inserts argument as required)
              #   end
              # end

              # p = Parent.new
              # puts p.speak

              #### EMBRACE AND EXTEND ####

              # class Person
              #   def speak
              #     "I'm a Person who is speaking"
              #   end
              # end

              # class Parent < Person
              #   def speak             
              #     super + "- SUPER EXTRA TEXT"    #=> pulls method from ancestor (can be altered as demonstrated)
              #   end
              # end

              # p = Parent.new
              # puts p.speak


              #### METHOD SCOPE ####

              # class Person
              #   def speak
              #     "I'm a Person who is speaking"
              #   end
              # end

              # class Parent < Person
              #   def speak             #creates infinite loop, as method is calling itself
              #     speak
              #   end
              # end

              # p = Parent.new
              # puts p.speak            #=> stack overflow error


              #### Parent / Child Relationship - Method hierarchy ####

              # class Parent
              #   def whoami
              #     puts "Im a parent"
              #   end
              # end

              # class Child < Parent
              #   def whoami        #=> overwrites less specific (ancestor/inherited) whoami method of Parent
              #     "I'm a child"
              #   end
              # end

              # c = Child.new
              # p c.whoami          #=> "I'm a child"

              #### Parent / Child Relationship ####

              # class Parent
              #   def whoami
              #     puts "Im a parent"
              #   end
              # end

              # class Child < Parent
              # end

              # p c = Child.new
              # c.whoami          #=> "I'm a parent"


              #### private = me and my decedents (most secure) ####
              #### protected = can be shared within ancestor chain (less secure than protected) ####

              # class Parent
              #   private
              #   def a_private_method
              #     puts "PRIVATE"
              #   end

              #   protected 
              #   def a_protected_method
              #     puts "PROTECTED"
              #   end
              # end

              # class Child < Parent
              #   def a_public_method
              #     a_protected_method
              #     puts "CHILD - PROTECTED"
              #   end

              #   def family_secret(other_child)
              #     puts "Family secret"
              #     other_child.a_protected_method
              #   end
              # end

              #     # p c = Child.new
              #     # p c.a_public_method
              #     # p c.a_private_method
              #     # p c.a_protected_method

              # p c1 = Child.new
              # p Child.ancestors           #=>ancestors can be passed protected info
              # p c2 = Child.new
              # p c1.family_secret(c2)


              #### WHY USE A PRIVATE METHOD WHEN IT ISN'T TRULY "PRIVATE"? ####
              #### NOT FOR SERIOUS SECURITY TECHNIQUE, MORE FOR ANTI-CODERS ####
              # class BankTransfer
              #   def transfer
              #     puts "transfer - withdraw"
              #     withdraw
              #     puts "transfer - deposit"
              #     deposit
              #   end

              #   private
              #   def withdraw
              #     puts "withdraw"
              #   end

              #   def deposit
              #     puts "deposit"
              #   end
              # end

              # bt = BankTransfer.new
              # p bt
              # p bt.transfer
              # #p bt.withdraw                  #=> private method ERROR
              # #p bt.deposit                   #=> private method ERROR
              # p bt.send :transfer
              # p bt.send :deposit


              #### Using .send to bypass privacy ####

              # class Table
              #   def a_public_method
              #     puts "Public method"
              #   end

              #   private                   
              #   def a_private_method
              #     puts "Private method"
              #   end
              # end

              # t = Table.new
              # t.a_public_method
              # t.send :a_private_method      #=> reveals a_private_method  


              #### HOW TO REVEAL A PRIVATE METHOD ####

              # class Table
              #   def a_public_method
              #     puts "Public method"
              #     a_private_method        #=> to reveal a_private_method
              #   end

              #   private                   
              #   def a_private_method      
              #     puts "Private method"
              #   end
              # end

              # t = Table.new
              # t.a_public_method           #=> a_private_method is effectively called via a_public_method


              #### HOW TO SET PRIVATE METHOD ####

              # class Table
              #   def a_public_method
              #     puts "Public method"
              #   end

              #   private                   #=> Anything between private / end will not be publicly available
              #   def a_private_method      #=> This can only be called
              #     puts "Private method"
              #   end
              # end

              # t = Table.new
              # t.a_public_method


    #### CLASS VARIABLES - CREATE A METHOD TO ASSIGN SERIAL NUMBERS TO EACH Table.new ####

              # class Table                                 
                  
              #     attr_accessor :id

              #     @@next_table_id = 1         

              #     def self.next_table_id    #added self to method to return variable#
              #         @@next_table_id
              #     end

              #     def initialize
              #       @id = @@next_table_id
              #       @@next_table_id += 1
              #     end
                  
              #     def preview_next_table_id
              #       @@next_table_id
              #     end

              #     def change_next_table_id(next_id)       #could be an issue, if nil or other value is passed
              #       @@next_table_id = next_id
              #     end

              #     def put_on(something)
              #       @tabletop << something
              #     end

              #     def look_at
              #       @tabletop
              #     end

              #   end

              #   a = Table.new                         #=> @id = 1
              #   p a
              #   p a.id
              #   b = Table.new                         #=> @id = 2
              #   p b
              #   p b.id
              #   p b.preview_next_table_id             #=> 3
              #   p b.change_next_table_id(10000)       #=> 100000
              #   p b.preview_next_table_id             #=> 100000
              #   t2 = Table.new
              #   p t2.id                               #=> 100000

              ## @ = 2 tabs in, @@ = 1 tab in, and below ##

              # class Table                   
              #     attr_reader: @id              

              #     @@next_table_id = 1         

              #     def self.next_table_id    
              #         @@next_table_id
              #       end

              #     def initialize
              #       @id = @@next_table_id
              #       @@next_table_id += 1
              #     end

              #     def put_on(something)
              #       @tabletop << something
              #     end

              #     def look_at
              #       @tabletop
              #     end

              #   end

              #   p a = Table.new      #=> @id = 1
              #   p a
              #   p b = Table.new      #=> @id = 2
              #   p b



              #### add self to method, implement counter ####

              # class Table                   
                                    
              #     attr_accessor :num_legs

              #     @@next_table_id = 1         

              #     def self.next_table_id    #added self to method to return variable
              #         @@next_table_id
              #       end

              #     def initialize 
              #       @tabletop = []
              #       @id = @@next_table_id   #added @id method variable to log @@next_table_id more locally
              #       @@next_table_id += 1    #increments @@next_table_id by 1 
              #     end

              #     def self.has_legs?
              #       true
              #     end

              #     def put_on(something)
              #       @tabletop << something
              #     end

              #     def look_at
              #       @tabletop
              #     end

              #   end

              #   a = Table.new
              #   p a


              ##SYNTAX ERRORR##
                # class Table                   #recreates class Table (partially copied from below examples)
                    
                    # def next_table_id         #creates method to "view" variable (will error below)
                    #   @@next_table_id
                    # end
                            
                #   attr_accessor :num_legs

                #   def initialize
                #   end

                #   def put_on(something)
                #     @tabletop << something
                #   end

                #   def look_at
                #     @tabletop
                #   end

                #   @@next_table_id = 1         #new variable created

                # end

                # #p Table.@@next_table_id      => syntax error (@ or @@ is a "secret")
                # #p Table.next_table_id        => syntax error


      ## OOP Thinking ##
      ##From the perspective of the Table, what type of addition should I##
          ##be concerned about? Problem is oriented around an object##

                # class Table

                #   attr_accessor :tabletop

                #   def initialize
                #     @tabletop = []
                #   end

                #   def add (item)
                #     @tabletop.push(item)
                #   end

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
          #     if String, String.concat
          #     if Array, Array.concat
          #     if Nil or Hash, ERROR
          #     if anthiny thats not a number, ERROR
          #     Uless its relayed to a number
          #     Unless it knows how to add some other way
          #   else
          #     left + right
          #   end


  ## MIXINS ##
        ###FEATURES(MODULES) TO ADD TO CLASS ITEMS###

          # class Vehicle
          #   attr_accessor :engine, :tires
          # end

          #  class Car < Vehicle
          #     module Talkative
          #       def speak
          #         puts "Hello WORLD"
          #       end
          #     end
          #  end

          # class Kitt < Car          #inherit features from Car class
          #   include Talkative       #More or less copy/pastes speak method to Kitt class
          # end
          
          # p Kitt.ancestors          #introspection
          # p Kitt.class              #introspection
          # p Kitt.superclass         #next class level upriver

          # kitt = Kitt.new           #creates new object "kitt" of Class = Kitt
          # kitt.speak                #demonstrates calling of included method Car>Talkative>Speak

          # # class Motorcycle < Vehicle
          # #   end


  ## CREATE ANOTHER CLASS VEHICLE (SUPERCLASS: THE IMMEDIATE PARENT) AND LINK CAR/MOTORCYCLE ##

          # class Vehicle
          #   attr_accessor :engine, :tires
          # end

          # class Car < Vehicle
          # end

          # class Motorcycle < Vehicle
          #   end

          # p Car.ancestors
          # p Car.superclass
          # p Motorcycle.ancestors
          # p Motorcycle.superclass

          # my_car = Car.new
          # p my_car.engine           # => Nil because none input, but nil isn't ERROR
          # p my_car.tires            # => Nil because none input, but nil isn't ERROR 


  ##NOTICE REPEATED ATTRIBUTE CODE, REDUNDANT##

          # class Car
          #   attr_accessor :engine, :tires
          # end

          # class Motorcycle
          #   attr_accessor :engine, :tires
          # end


  ##CREATE MY_CAR AND SEE AVAILABLE OPTIONS (INTROSPECTION)##

          # class Car
          #   end
          # p Car.class, Car.methods

          # my_car = Car.new
          # p my_car.class, my_car.methods, my_car.methods.size


  ##CREATE CLASS AND SEE AVAIABLE OPTIONS (INTROSPECT)##
          
          # class Car
          #   end
          # p Car.class, Car.methods, Car.ancestors


  ##CREATE HAS_LEGS? METHOD##

          # class Table
            
          #   attr_accessor :num_legs

          #   def initialize (num_legs)
          #     @tabletop = []
          #     @num_legs = num_legs
          #   end

          #   def self.has_legs?
          #     true
          #   end

          #   def put_on(something)
          #     @tabletop << something
          #   end

          #   def look_at
          #     @tabletop
          #   end

          # end

          # a_table = Table.new(5)   
          # a_table.put_on 1
          # a_table.put_on 2
          # p a_table.num_legs
          # p a_table.num_legs = 3
          # p Table.has_legs?             #returns true/false
          ##ATTR_ACCESSOR IN CORRECT LOCATION##
                    #   class Table
                      
                    #   attr_accessor :num_legs

                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    # end

                    # a_table = Table.new(5)   
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.num_legs
                    # p a_table.num_legs = 6  

          ##ATTR_ACCESSOR METHOD##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    #   # attr_reader :num_legs 

                    #   # attr_writer :num_legs

                    #   attr_accessor :num_legs         #replaces both reader/writer methods - USUALLY LOCATED BEFORE INITIALIZE

                    # end

                    # a_table = Table.new(5)            
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.num_legs
                    # p a_table.num_legs = 6          



          ##ATTR_WRITER METHOD##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    #   attr_reader :num_legs 
                      
                    #   # def change_legs(num_legs)
                    #   #   @num_legs = num_legs
                    #   # end

                    #   attr_writer :num_legs           #replaces above commented code -  notice : - allows for write privelages

                    # end

                    # a_table = Table.new(5)            #num_legs arg
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.num_legs
                    # p a_table.num_legs = 6            #to pass writer variables new values




          ##CHANGE LEGS? DEFINE NEW METHOD##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    #   attr_reader :num_legs 
                      
                    #   def change_legs(num_legs)
                    #     @num_legs = num_legs
                    #   end

                    #   #attr_writer :num_legs

                    # end

                    # a_table = Table.new(5)  
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.num_legs
                    # p a_table.change_legs(4)
                    

          ##ATTR_READER METHOD##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    #   # def method num_legs
                    #   #   @num_legs
                    #   # end

                    #   attr_reader :num_legs      #replaces above commented code -  notice : - provides READ ability

                    # end

                    # a_table = Table.new(5)       
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.num_legs



          ##NUM_LEGS appears when you call p a_table##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #     @num_legs = num_legs
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end

                    #   def method num_legs
                    #     @num_legs
                    #   end

                    # end

                    # a_table = Table.new(5)        
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table


          ##HOW MANY LEGS? - NOT A SET VALUE (COULD BE VARIABLE)##
          ## ADD AN ARGUMENT TO INITIALIZE METHOD##
          ## WHEN ARGUMENT IS ADDED, ARGUMENT MUST BE INCLUDED IN .NEW CALL##

                    # class Table
                    #   def initialize (num_legs)
                    #     @tabletop = []
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end
                    # end

                    # a_table = Table.new(5)        #num_legs arg
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table


          ##HOW TO VIEW @TABLETOP?##

                    # class Table
                    #   def initialize
                    #     @tabletop = []
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.look_at           #=> effectively shows @tabletop

                    # p @tabletop                 #=> nil



          ##INITIALIZE METHOD - RUBY SPECIFIC - ##
          ##CREATES @TABLETOP ONCE PER EACH TABLE.NEW CALL##

                    # class Table
                    #   def initialize
                    #     @tabletop = []
                    #   end

                    #   def put_on(something)
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # a_table.put_on 2
                    # p a_table.look_at



          ##1 DOESNT HOLD WHEN 2 IS ADDED##
          ## @TABLETOP IS RECREATED FOR EACH TIME PUT_ON IS CALLED##

                    # class Table
                    #   def put_on(something)
                    #     @tabletop = []
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # #p a_table.look_at
                    # a_table.put_on 2
                    # p a_table.look_at


          ## USING THE @ CREATES AN "INSTANCE VARIABLE" (ONLY AVAILABLE IN THE INSTANCE [CLASS])

                    # class Table
                    #   def put_on(something)
                    #     @tabletop = []
                    #     @tabletop << something
                    #   end

                    #   def look_at
                    #     @tabletop
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # p a_table.look_at


          ##tabletop variable isn't continuing to look_at##

                    # class Table
                    #   def put_on(something)
                    #     tabletop = []
                    #     tabletop << something
                    #   end

                    #   def look_at
                    #     tabletop
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # p a_table.look_at


          ##DOESNT RETURN 1 when PUT_ON IS CALLED##

                    # class Table
                    #   def put_on(something)
                    #     [] << something
                    #   end

                    #   def look_at
                    #     []
                    #   end
                    # end

                    # a_table = Table.new
                    # a_table.put_on 1
                    # p a_table


###NEEDLE IN A HAYSTACK###
  ##BOTH ARE O(n^2) BUT BOTTOM WILL RUN FASTER BECAUSE OF BREAK##

        # def find_needle(haystack, needle)
        #   i = 0
        #   loop do
        #     if haystack[i] == needle
        #       return i
        #     elsif i > haystack.length
        #       return nil
        #     end
        #     i += 1
        #   end
        # end

        # def find_needle2(haystack, needle)
        #   i = 0
        #   found = nil
        #   loop do
        #     if haystack[i] == needle
        #       found = i
        #     elsif i > haystack.length
        #       break
        #     end
        #     i += 1
        #   end
        #   found
        # end

        #puts find_needle((0..100000000).to_a, 100000000)
        #puts find_needle2((0..100000000).to_a, 100000000)


####HAPPY NEW YEAR!!!!######

  # Write a program that prints a countdown from 10 to 0. At 0, output “Happy New Year!”. Then start over again at 10. 
  # Pause for 1 second between each number.
  # Don’t use loop, while, until, or for. Use blocks and methods from the Enumerable module instead.
  # You will probably use methods I haven’t talked about in any lectures. And you’ll probably want to run this from the Terminal.

  #cycle(n=nil) { |obj| block } → nil

        # seconds_remaining = (0..10).to_a.reverse
        # puts "How many times would you like to say 'Happy New Years!'?"

        # while input = gets.chomp 
        #   if input =~/\D/
        #     puts "Please input only a single number.\nHow many times would you like to say 'Happy New Years!'?"
        #   else break
        #   return input
        #   end
        # end

        # $num_of_cycles = input.to_i

        # def happy_new_year (time)
        #   time.cycle($num_of_cycles) do |x| 
        #     if x == 0 
        #       puts "0!  Happy New Year!";
        #       sleep(1) 
        #     else puts x; sleep(1)
        #     end
        #   end
        # end

        # happy_new_year(seconds_remaining)


###REMOVE DUPLICATES FROM AN ARRAY###
  ###without using the uniq method.###

  # arr = [1,1,2,2,3,3]

  # def duplicates (array)
  #   new_arr = []
  #   array.each do |x|
  #     if new_arr.include?(x) == false
  #       new_arr << x
  #     end
  #   end
  #   return new_arr
  # end

  # p duplicates(arr)


###Introspection###
    # a = 1
    # p %w[#{a} b c d][0]
    # p %W[#{a} b c d][0]


###Reduce/Inject Method###
  #Turn this:
  #start = [[1, 2], [3, 4]]
      # into this:
      # [1,2,3,4]
      # using the Array’s inject method (which is also known as reduce).
          # inject(initial) { |memo, obj| block } → obj 
  # p start.reduce(:+)


#fizzbuzz fizz_buzz
  # def fizz_buzz_fizzbuzz (array)
  #   array.each_with_index do |num,index|
  #     if num == 0
  #       puts num
  #     elsif index%15 == 0
  #       puts "FIZZBUZZ"
  #     elsif index%5 == 0
  #         puts "BUZZ"
  #     elsif index%3 == 0
  #         puts "FIZZ"
  #     else
  #         puts num
  #     end
  #   end
  # end
  # arr = (0..100)
  # puts fizz_buzz_fizzbuzz(arr)


###OBJ, KERNEL, BASICOBJ METHODS IN A SORTED, UNIQUE ARRAY###
  #   new_array = []
    
  #   array.each do |x|
  #     new_array << x.methods
  #   end

  #   flatten_array = new_array.flatten
  #   final_array = flatten_array.uniq
    
  #   return final_array.sort

  # end

  # start_array = self.class.ancestors
  # p initial_to_final(start_array)
          

###OTHER ATTEMPTS AT ABOVE###

      # def class_methods (array)
      #    new_array = []
      #    array.each do |x|
      #     new_array << x.methods
      #   end
        
      #   # obj_array = []
      #   # object_string = ""
      #   # object_array = []
      #   # obj_array << new_array[0]
      #   # object_string = obj_array.join(",")
      #   # object_array = object_string.split(",")
        
      #   # kern_array = []
      #   # kernel_string = ""
      #   # kernel_array = []
      #   # kern_array << new_array[1]
      #   # kernel_string = kern_array.join(",")
      #   # kernel_array = kernel_string.split(",")


      #   # basic_obj_array = []
      #   # basic_object_string = ""
      #   # basic_object_array = []
      #   # basic_obj_array << new_array[2]
      #   # basic_object_string = basic_obj_array.join(",")
      #   # basic_object_array = basic_object_string.split(",")

      #   return new_array
      # end

        # # object_array.each do |x|
        # #   unless newer_array.include? x
        # #     newer_array << x
        # #   end
        # # end
        # # kernel_array.each do |x|
        # #   unless newer_array.include? x
        # #     newer_array << x
        # #   end
        # # end
        # # basic_object_array.each do |x|
        # #   unless newer_array.include? x
        # #     newer_array << x
        # #   end
        # # end
        # # return newer_array.sort
