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
  
  xit "returns available products" do
    
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