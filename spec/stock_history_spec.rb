require "spec_helper"

describe "VendingMachine Stock history" do
  
  before :all do
    @machine = Machine.new
  end
  
  it "updates stock after a successful transaction" do
    @machine.transaction do |t|
      t.product_select  Product.new "lemonade"
      t.coins_insert    Coin.new("50p")
    end

    # initial stocks are 1 lemonade and 4 "50p"
    @machine.stock.products["lemonade"].should  == 0
    @machine.stock.coins["50p"].should          == 5
  end

end