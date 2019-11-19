require 'pry'

class CashRegister
    attr_accessor :total, :discount, :amounts, :item, :prices

    def initialize(discount=0)
        @total = 0
        @discount = discount 
        @items = [] 
        @prices = []
        @amounts = []
    end

    def discount
        @discount
    end

    def add_item(item, price, amount=1)

        amount.times do
            @items << item
            @prices << price 
         end
        @amounts << amount
        @total += price * amount 
    end

    def apply_discount
        @discount = (100.00 - @discount.to_f) / 100.00
        @total = (@total * @discount).to_i
        if @total != 0 
            p "After the discount, the total comes to $#{@total}."
        else
            p "There is no discount to apply."
        end
    end

    def items 
        @items
    end

    def void_last_transaction 
        @amounts.pop.times do 
            @items.pop
            removed_item = @prices.pop
            @total -= removed_item
          end
          return total
    end

end
