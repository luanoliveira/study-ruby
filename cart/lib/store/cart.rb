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

        def total
            return @itens.count
        end
    end
end