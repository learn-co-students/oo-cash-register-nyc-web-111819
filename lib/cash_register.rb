class CashRegister
    @items = []
    def initialize(*discount)
        @total = 0
        @discount = discount[0]
        @items = []
        if discount == nil
            return "No discount to apply!"
        end
    end
    def discount 
        @discount
    end
    def total
        @total
    end
    def total=(total)
        @total = total
    end
    def add_item(title,price,*num)
        initial = @total
        i = num[0]
        if defined? num == true
            if i != nil
                @total += price*(i).to_i
                i.times do
                    @items << title
                end
            end
        end
        if initial == @total
            @total += price
            @items << title
        end
        @last_transaction = initial
    end
    def items
        @items
    end
    def apply_discount
        if @discount != nil
            @total = @total - @total*(Float(@discount)/100)
            return "After the discount, the total comes to $#{@total.round()}."
        end
        "There is no discount to apply."
    end
    def void_last_transaction
        @total = @last_transaction
    end
end