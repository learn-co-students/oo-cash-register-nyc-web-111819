require 'pry'

class CashRegister

    attr_accessor :total, :last_transaction
    attr_reader :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @@items = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        @quantity = quantity
        quantity.times {@@items << title}
        @last_transaction = price 
    end 

    def apply_discount
        if @discount != 0
            @total -= @total*(@discount/100.0)
            "After the discount, the total comes to $800."
        else 
            "There is no discount to apply."
        end 
    end 

    def items 
        @@items
    end 

    def void_last_transaction
        @quantity.times {@@items.pop}
        if @@items.length == 0
            @total = 0
        else 
            @total -= @last_transaction
        end
    end 

end 
