class CashRegister
    attr_accessor :discount, :total, :items, :last_item_price

    def initialize (discount = 0)
        @discount = discount
        @total = 0.0
        @items = []
    end


    def add_item (name = "nothing", price = 0.0, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            self.items << name
        end
        self.last_item_price = price * quantity
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end

        self.total = (self.total * (100.0 - self.discount) / 100)
        return "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        self.total -= self.last_item_price
        if self.items == []
            self.total = 0
        end
    end
end