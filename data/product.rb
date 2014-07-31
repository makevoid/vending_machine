class Product
  attr_reader :name, :price
  
  def initialize(name)
    @name = name
    @cost = PRICES[name]
  end
  
  PRICES = {
    "soda"      => 99,
    "lemonade"  => 50,
    "pie"       => 1_50,
    "popcorn"   => 1_10,
  }

end