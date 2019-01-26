require_relative "database"
require "csv"

class Contact < ActiveRecord::Base
    self.table_name = "contatos"
end

class Cbo < ActiveRecord::Base
    validates_uniqueness_of :code
    self.table_name = 'cbos'
end


=begin
occupation = CBO_Occupation.new
occupation.code = 123
occupation.title = 'Teste de Occupation'
puts occupation.save!
puts occupation.inspect
=end

csv_index = 0

CSV.foreach("./files/CBO2002_ocupacao.csv", col_sep: ";") do |row|
    begin
        occupation = Cbo.new
        occupation.code = row[0]
        occupation.title = row[1]
        puts occupation.save!
        puts occupation.inspect
    rescue Exception => e  
        puts "Error running script: " + e.message
    end
    
=begin
    puts "Código: #{row[0]}"
    puts "Título: #{row[1]}"
    puts "Index: #{csv_index}"
    puts "------------"
    csv_index += 1
=end
end

puts Cbo.count
