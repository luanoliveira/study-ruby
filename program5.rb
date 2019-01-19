operation = nil
number1 = nil
number2 = nil

loop do
    unless operation
        puts "1 = add"
        puts "2 = subtract"
        puts "3 = divide"
        puts "4 = multiply"
        puts "0 = exit"
        print "Choose math operation: "
        choose = gets.chomp.to_i

        if choose == 0
            break
        end

        if [1,2,3,4].include? choose
            operation = choose
        else
            puts "wrong choose, try again!"
        end
    end

    if operation
        print "Enter first number: "
        number1 = gets.chomp.to_f
        print "Enter second number: "
        number2 = gets.chomp.to_f

        case operation
        when 1
            puts "result is #{number1+number2}"
        when 2
            puts "result is #{number1-number2}"
        when 3
            puts "result is #{number1/number2}"
        when 4
            puts "result is #{number1*number2}"
        end

        break
    end
end