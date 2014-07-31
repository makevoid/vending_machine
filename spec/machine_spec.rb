require 'spec_helper'

describe Machine do
  it "initializes" do
    subject.should be_a Machine
  end
  
  it "creates a transaction" do
    subject.transaction do |t|
      t
    end.should be_a Transaction
  end
  
  it "has a stock with products" do
    subject.stock.products.should be_a Hash
    stock_product = subject.stock.products
    stock_product.keys.first.should    be_a  Product
    stock_product.values.first.should  be_an Integer
  end
  
  it "stores coins" do
    subject.stock.coins.should be_a Hash
    stock_coins = subject.stock.coins
    stock_coins.keys.first.should    be_a  Coin
    stock_coins.values.first.should  be_an Integer
  end
   
  it "returns available products" do
    subject.products.should == []
  end
  
  
  it "returns contained coins"
  it "returns balance"
  it "returns transaction log"
end

### reference spec

# machine.products = [<Product>, <Product>, ...]
# machine.coins = [<Coin>, <Coin>, ...]
# 
# machine.balance = £ xxx
# 
# machine.transactions