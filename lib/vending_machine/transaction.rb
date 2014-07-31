module VendingMachine
  class Transaction
    
    attr_reader :selection, :coins_inserted
    
    def initialize(machine=nil)
      @machine = machine
      @coins_inserted = []
    end
    
    def product_select(product)
      @selection = product
    end
    
    def coins_insert(coin)
      @coins_inserted << coin
    end
    
    # note: using hashes as response here, they can easily converted to JSON in the future "production app"
    #
    def resolve
      return { message: "You have to select a product", status: :error } unless @selection
      
      if enough_coins? 
        stock_coins
        remove_product_from_stock
        change = calculate_change
        { product: @selection, change: change, message: "Thanks for the purchase", status: :success }
      else
        { product: nil, change: nil, message: "Not enough money bro", status: :error }
      end
    end
    
    protected
    
    def stock_coins
      stock = @machine.stock
      @coins_inserted.map do |coin|
        stock.coins[coin.label] += 1
      end
    end
    
    def remove_product_from_stock
      stock = @machine.stock
      stock.products[@selection.name] -= 1
    end
    
    def calculate_change
      value = calculate_change_value
      return [] if value == 0
      
      change = []
      
      # TODO use recursion to support more than 1 coin as change 
      Coin.all.map do |coin|
        if value >= coin.value
          change << coin
          value -= coin.value
        end
      end
      # recurse until here
      
      return change
    end
    
    def calculate_change_value
      coins_value(@coins_inserted) - @selection.price 
    end
    
    def enough_coins?
      calculate_change_value >= 0
    end
    
    def coins_value(coins)
      coins.map{ |coin| coin.value }.inject(:+) || 0
    end
  end
end