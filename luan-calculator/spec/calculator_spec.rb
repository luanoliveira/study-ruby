require "luan/calculator"

RSpec.describe Luan::BasicCalculator do

    context "testar itialize da class" do
        it "testar initialize com valor" do
            basic = Luan::BasicCalculator.new(2)
            basic.subtract(1)
            expect(basic.total).to eq(1)
        end
    end

    context "testar operação de soma" do
        it "testar soma com números" do
            basic = Luan::BasicCalculator.new
            basic.add(1,2,3)
            expect(basic.total).to eq(6)
        end

        it "testar soma com quantidade variada de números" do
            basic = Luan::BasicCalculator.new
            basic.add(1,2,3)
            expect(basic.total).to eq(6)
            basic.reset

            basic.add(45,50)
            expect(basic.total).to eq(95)
            basic.reset

            basic.add(3,3,4,5)
            expect(basic.total).to eq(15)
            basic.reset
        end
    end

    context "testar operação de subtração" do
        it "testar subtração de números" do
            basic = Luan::BasicCalculator.new
            basic.subtract(50)
            expect(basic.total).to eq(-50)
        end

        it "testar subtração com vários números" do
            basic = Luan::BasicCalculator.new
            basic.add(50, 50)
            expect(basic.total).to eq(100)

            basic.subtract(4)
            expect(basic.total).to eq(96)

            basic.subtract(25,25)
            expect(basic.total).to eq(46)
        end
    end

    context "testar operação de multiplicação" do
        it "testar multiplicação de números" do
            basic = Luan::BasicCalculator.new(2)
            basic.multiply(2)
            expect(basic.total).to eq(4)
            basic.reset

            basic = Luan::BasicCalculator.new(2)
            basic.multiply(3)
            expect(basic.total).to eq(6)
        end
    end

end