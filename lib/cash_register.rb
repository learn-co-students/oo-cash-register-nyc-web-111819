require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :title, :price, :quantity, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @last_item = 0
        if quantity != nil
            quantity.times do 
                @items << title
            end
            total_price = price * quantity
            @total += total_price
            @last_item = total_price
        else
            @items << title
            @total += price
            @last_item = price
        end
        
    end

    def apply_discount
        if @discount != 0
        discount_num = @discount / 100.to_f
        sub_total = self.total * discount_num 
        self.total =  self.total - sub_total.to_i
         "After the discount, the total comes to $#{self.total}."
        else
         "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = self.total - @last_item
    end
end
