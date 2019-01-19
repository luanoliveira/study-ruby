print "Enter a integer number: "
number = gets.chomp.to_i

if number > 10
    puts "The number #{number} is greater than 10"
end

if number < 10
    puts "The number #{number} is less than 10"
end

if number == 10
    puts "The number #{number} is equal to 10"
end

store_status = "open"

=begin
if not store_status=="closed"
    puts "The store is not closed!"
end
=end
unless store_status=="closed"
    puts "The store is not closed!"
end

print "Enter your age: "
age = gets.chomp.to_i

case age
when 1..5
    puts "You is very young"
when 6..10
    puts "You is young"
when 11..20
    puts "You is old"
else
    puts "not found"
end