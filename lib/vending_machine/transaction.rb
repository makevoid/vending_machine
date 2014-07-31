module VendingMachine
  class Transaction
    
    attr_reader :selection, :coins_inserted
    
    def initialize 
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
        change = calculate_change_value 
        { product: @selection, change: change, message: "Thanks for the purchase", status: :success }
      else
        { product: nil, change: nil, message: "Not enough money bro", status: :error }
      end
    end
    
    protected
    
    def calculate_change
      calculate_change_value #TODO: in coins!
    end
    
    def calculate_change_value
      coins_value(@coins_inserted) - @selection.price 
    end
    
    def enough_coins?
      true # TODO: hardcoded, must implement!!!
    end
    
    def coins_value(coins)
      coins.map{ |coin| coin.value }.inject(:+) || 0
    end
  end
end