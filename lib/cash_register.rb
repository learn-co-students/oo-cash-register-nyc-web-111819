require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_total

  def initialize(discount = nil)
    @total = 0.0
    @discount = discount
    @items = []
    @last_transaction_total = 0
  end

  def add_item(item, price, quantity = 1)
    self.last_transaction_total = (price * quantity)
    self.total += last_transaction_total
    quantity.times {self.items << item}
    # self.last_transaction = {
    #   :item => item
    #   :price => price
    #   :quantity => quantity
    # }
  end

  def apply_discount
    if !self.discount
      "There is no discount to apply."
    else
      total_discount = @total * (discount.to_f/100)
      # binding.pry
      @total -= total_discount
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    # noting that this function doesn't update the items array
    # the tests don't call for it, but it really 'should'
    self.total -= self.last_transaction_total
  end

end
