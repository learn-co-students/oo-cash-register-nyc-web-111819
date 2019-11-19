require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :prices, :quantities

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
        @quantities = []
    end

    def add_item(title, price, quantity = 1)

         quantity.times do
            @items << title
            @prices << price
         end

            @quantities << quantity

         @total += price * quantity
    end 

    def apply_discount()
        if @discount > 0 
            @discount = @discount * 10
            @total = @total - @discount
            return "After the discount, the total comes to $#{total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @quantities.pop.times do 
          @items.pop
          removed_item = @prices.pop
          @total -= removed_item
        end
        return total
    end

end

