require 'store/cart'

describe Store::Cart do
    context "#add" do
        it "add new itens into of cart" do
            prod1 = Store::CartItem.new
            prod2 = Store::CartItem.new
            prod3 = Store::CartItem.new
            subject.add(prod1)
            subject.add(prod2)
            expect(subject.total).to eq(2)
            subject.add(prod3)
            expect(subject.total).to eq(3)
        end
    end
end