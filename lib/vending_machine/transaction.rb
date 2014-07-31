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
  end
end