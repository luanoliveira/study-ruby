require "os"

puts OS.cpu_count  
puts OS.bits

class People
    def speak(words)
        puts words
    end
end

class Employee < People
end

test1 = People.new
test1.speak("Hello World")