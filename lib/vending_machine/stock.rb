module VendingMachine
  class Stock
    
    PRODUCTS = {
      "soda"       => 3,
      "lemonade"   => 1,
      "pie"        => 5,
      "popcorn"    => 2,
    }
  
    COINS = {
      "1p"  => 5,
      "2p"  => 5,
      "5p"  => 3,
      "10p" => 3,
      "20p" => 2,
      "50p" => 4,
      "£1"  => 10,
      "£2"  => 2,
    }
  
    def products
      PRODUCTS
    end
  
    def coins
      COINS
    end

    def balance
      coins_value coins
    end
    
    protected
    
    def coins_value(coins)
      coins.map{ |coin, amount| Coin.new(coin).value * amount }.inject(:+)
    end
  end
end