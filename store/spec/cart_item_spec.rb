require "store/cart_item"

describe Store::CartItem do

    subject do
        Store::CartItem.new(100)
    end

    it "generate uid for item" do
        expect(subject.id).not_to eq(nil)
    end
    
end