module Luan

  class BasicCalculator
    attr_reader :total
  
    def initialize(total=0)
      @total = total
    end
  
    def reset
      @total = 0
    end
  
    def add(*args)
  
      args.each do |number|
        @total += number
      end
  
      @total
    end
  
    def subtract(*args)
      
      args.each do |number|
        @total -= number
      end
  
      @total
    end

    def multiply(*args)
      
      args.each do |number|
        @total *= number
      end

      @total      
    end
  
  end

end