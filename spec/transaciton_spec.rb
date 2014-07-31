require "spec_helper"

describe VendingMachine::Transaction do
  it "initializes" do
    subject.should be_a Transaction
  end
  
  it "lets a product to be selected" do
    t = subject
    product = Product.new("lemonade")
    t.selection.should be_nil
    t.product_select product
    t.selection.should be product
  end
  
  it "lets a coin to be inserted in" do
    t = subject
    coin = Coin.new("50p")
    t.selection.should be_nil
    t.coins_insert coin
    t.coins_inserted.should === [coin]
    coin2 = Coin.new("10p")
    t.coins_insert coin2
    t.coins_inserted.should === [coin, coin2]
  end
  
  describe "full transaction" do
    before :all do
      @machine = Machine.new
    end
    
    before do
      @machine.restock!
    end
    
    it "resolves a happy transaction" do
      product = Product.new "lemonade"
      @machine.transaction do |t|
        t.product_select  product
        t.coins_insert    Coin.new("50p")
      end.should == {
        product: product, 
        change: 0, 
        message: "Thanks for the purchase", 
        status: :success,
      }
    end
    
    it "asks to select a product" do # note: call resolve automatically after some time of inactivity
      product = Product.new "lemonade"
      @machine.transaction do |t|
        t.coins_insert    Coin.new("50p")
      end.should == {
        message: "You have to select a product", 
        status: :error,
      }
    end
    
    it "doesn't eats (steals) coin from one transaction to another" do 
      product = Product.new "lemonade"
      @machine.transaction do |t|
        t.coins_insert    Coin.new("50p")
      end
      @machine.transaction do |t|
        t.product_select  product
      end[:status].should == :success
    end
    
  end
  
  # after each event -> callback
  #  returns the product / asks for more coins (reopen a transaction block)
end

