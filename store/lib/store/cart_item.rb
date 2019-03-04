require "securerandom"

module Store
    class CartItem
        attr_reader :id, :price

        def initialize(price)
            @id = SecureRandom.hex
            @price = price
        end
    end
end