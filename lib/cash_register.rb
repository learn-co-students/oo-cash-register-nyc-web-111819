require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :transactions
    attr_reader 
    attr_writer 


    def initialize  (discount=0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item (title, price, quantity=1)
        @total = @total + price * quantity
        quantity.times {|num| @items << title}
        @transactions << price * quantity
    end

    def apply_discount
        @total = @total - @total * (@discount / 100.0) 
        @discount > 0 ? "After the discount, the total comes to $#{@total.to_i}." : "There is no discount to apply."
    end
    
    def void_last_transaction
        @total = @total - @transactions[-1]
        # if @transactions.size == 0
        #     @total = 0.0
        # end
    end
end
