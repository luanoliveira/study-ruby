def say(name="Ruby")
    message = "Welcome Mr.#{name}"
    yield(message, name)
end

say('Luan Oliveira') do |message|
    puts message
end

say('Luan Oliveira') { |message| puts message }

say do |message,name|
    puts "Other message for #{name}"
end