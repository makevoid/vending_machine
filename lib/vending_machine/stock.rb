module VendingMachine
  class Stock
    PRODUCTS = {
      Product.new("soda")       => 3,
      Product.new("lemonade")   => 1,
      Product.new("pie")        => 5,
      Product.new("popcorn")    => 2,
    }
  
    COINS = {
      Coin.new("1p" ) => 5,
      Coin.new("2p" ) => 0,
      Coin.new("5p" ) => 0,
      Coin.new("10p") => 3,
      Coin.new("20p") => 0,
      Coin.new("50p") => 4,
      Coin.new("£1" ) => 10,
      Coin.new("£2" ) => 2,
    }
  
    def products
      PRODUCTS
    end
  
    def coins
      COINS
    end

    def balance
      raise "TODO: implement balance as total coins value (sum)"
    end
  end
end