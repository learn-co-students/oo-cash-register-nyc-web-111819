require 'pry'

class CashRegister


    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total=(total)
        @total = total
    end

    def total
        @total
    end

    def discount
        @discount
    end


    def add_item(title, price, quantity=1)
        item_hash = {}

        @total += (price * quantity)
        
        item_hash[:title] = title
        item_hash[:quantity] = quantity
        item_hash[:price] = price
        
        @items << item_hash
        
    end

    def apply_discount
        
        skidka = discount/100.to_f
        if  discount !=0   
            @total = total - (total * skidka)
            "After the discount, the total comes to $800."
        else
            "There is no discount to apply."
        end
    
    end

    def items
        item_array = []
        
        @items.each do |item_hash|
        
        item_hash[:quantity].times do
            item_array << item_hash[:title]
        end

        #    counter = 0
        #    while counter < item_hash[:quantity]
        #         item_array << item_hash[:title]
        #         counter += 1
        #    end
        end
        item_array
    end

    def void_last_transaction
        item_hash = @items.pop
        @total = @total - (item_hash[:price] * item_hash[:quantity])
    end

end

