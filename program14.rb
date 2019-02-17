l1 = ->(name) do
    puts "LAMBDA 1 #{name}"
end

l2 = lambda do |name|
    puts "LAMBDA 2 #{name}"
end

#l1.call('TESTE 1')
#l2.call('TESTE 2')

class Query
    attr_accessor :table

    def initialize(table)
        @table = table
    end
end

conf = {
    singular: 'Notícia',
    plural: 'Notícias',
    query: Proc.new do |query|
        if query.instance_of? Query
            query.table = 'n'
        end       
    end
}

q1 = Query.new('noticias')

puts q1.table
puts conf.inspect

conf[:query].call(q1)
puts q1.table
