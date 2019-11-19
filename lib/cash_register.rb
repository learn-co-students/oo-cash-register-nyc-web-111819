
require 'pry'
class CashRegister

    attr_accessor :discount, :total, :price, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end 

    def add_item(items, price, quantity = 1) 
        @price = price
        @total += price * quantity
        if quantity > 1
            i = 0
            while i < quantity
                @items << items
                i += 1
            end
        else
            @items << items
        end
    end 

    def apply_discount
        if @discount > 0
            @to_discount = (price * discount)/100
            @total -= @to_discount
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end 

    def void_last_transaction
        @total -= @price 

    binding.pry
    end

end
