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
  
  describe "resolve" do
    # note: in a real production app I would test this, as this is an exercise I will leave this spec unimplemented
  end
  
  describe "enough_coins?" do
    # note: same as above, I'm leaving this spec unimplemented
  end
  
  context "full transaction" do
    before  do
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
        change: [], 
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
    
    it "gives change back to the user" do 
      product = Product.new "lemonade"
      transaction = @machine.transaction do |t|
        t.product_select  product
        t.coins_insert    Coin.new("£1")
      end
      transaction[:change].first.label.should == "50p"
      transaction.delete :change
      transaction.should == {
        product: product, 
        message: "Thanks for the purchase", 
        status: :success,
      }
    end
    
    # note: in a real production environment I'd add more complex specs to cover all edge cases, for this exercise I think it's enough
  end
  
end