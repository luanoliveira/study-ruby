require_relative "cart_item"

module Store    
    class Cart
        attr_reader :itens

        def initialize
            @itens = []
        end

        def add(item)
            if item.is_a? Store::CartItem
                @itens.push(item)
            end            
        end

        def remove(id)
            @itens.delete_if do |current|
                current.id == id
            end
        end

        def total
            @itens.reduce(0) do |current, item|
                current += item.price
            end
        end
    end
end