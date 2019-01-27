#Person = Struct.new(:name, :age)

module Helper
    def calc(num1, num2)
        num1+num2
    end
end

module App
    class Person
        include Helper

        attr_accessor :name, :age
    
        def initialize(name, age)
            @name = name
            @age = age

            self.class.define_method('separator') do |caracter="#"|
                caracter * 30
            end
        end
    end
end

person1 = App::Person.new("Luan Oliveira", 25)
puts person1.name
puts person1.age
puts person1.calc 2, 3

class << person1 
    def welcome_message
        "Welcome #{@name}, #{@age} age"
    end
end

puts person1.welcome_message

puts person1.separator "$"