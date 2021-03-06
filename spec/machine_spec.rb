require 'spec_helper'

describe Machine do
  it "initializes" do
    subject.should be_a Machine
  end
  
  it "creates a transaction" do
    subject.transaction do |t|
      t.should be_a Transaction
    end
  end
  
  it "has a stock with products" do
    subject.stock.products.should be_a Hash
    stock_product = subject.stock.products
    stock_product.keys.first.should == "soda"
    stock_product.values.first.should  be_an Integer
  end
  
  it "stores coins" do
    subject.stock.coins.should be_a Hash
    stock_coins = subject.stock.coins
    stock_coins.keys.first.should == "1p"
    stock_coins.values.first.should  be_an Integer
  end
   
  it "returns total balance" do # as sum of total coins value
    subject.balance.should == 17_00
  end
  
end