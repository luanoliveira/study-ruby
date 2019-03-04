require 'store/cart'

describe Store::Cart do
    context "work with cart itens" do
        it "add new itens cart" do
            prod1 = Store::CartItem.new(100)
            prod2 = Store::CartItem.new(150)
            prod3 = Store::CartItem.new(200)
            subject.add(prod1)
            subject.add(prod2)
            expect(subject.itens.count).to eq(2)
            subject.add(prod3)
            expect(subject.itens.count).to eq(3)
        end

        it "remove itens cart" do
            prod1 = Store::CartItem.new(100)
            prod2 = Store::CartItem.new(150)
            prod3 = Store::CartItem.new(200)
            
            subject.add(prod1)
            subject.add(prod2)
            expect(subject.itens.count).to eq(2)

            expect(subject.itens).to include(prod1)

            subject.remove(prod1.id)
            expect(subject.itens).not_to include(prod1)
            expect(subject.itens.count).to eq(1)

            subject.remove(prod2.id)
            expect(subject.itens).not_to include(prod2)
            expect(subject.itens.count).to eq(0)
        end

        it "check if empty cart" do
            prod1 = Store::CartItem.new(100)
            expect(subject.itens.empty?).to be_truthy
            subject.add(prod1)
            expect(subject.itens.empty?).not_to be_truthy
        end
    end

    context "check prices" do
        it "check prices of itens" do
            prod1 = Store::CartItem.new(100)
            prod2 = Store::CartItem.new(150)
            prod3 = Store::CartItem.new(200)

            expect(subject.total).to eq(0)
            subject.add(prod1)
            subject.add(prod2)
            expect(subject.total).to eq(250)
            subject.add(prod3)
            expect(subject.total).to eq(450)
        end
    end
end