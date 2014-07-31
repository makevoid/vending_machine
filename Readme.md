# Vending Machine

Vending machine exercise

---

Sample running session:

    irb -r ./config/env.rb
    
    >>

    include VendingMachine
    
    m = Machine.new
    
    m.transaction do
      
      # programmer's notes: not sure if block is the best construct 
    
    end
    

---

flow:

    Machine
      product is selected
      money is inserted
        (ask if not enough)
      returns the product

features:

    Load products
    Load/(Unload?) coins

    Log products, Log coins
    (file store? plain text / json?)

---

proposed api:

    machine = Machine.new

    machine.transaction do |t|
      t.product_select <Product>
      t.coins_insert [<Coin>, <Coin>, ...]    # t.coin_insert <Coin>
  
      # callback
      # returns the product (+ coins [change]) / asks for more coins (reopen a transaction block)
    end

    machine.products = [<Product>, <Product>, ...]
    machine.coins = [<Coin>, <Coin>, ...]

    machine.balance = £ xxx
    
    machine.transactions # stores only successful transactions, I suppose the machine timeouts after a failed transaction and gives the coins back to the user 
  
---

problem in extended text form  

The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. It should also return change if too much money is provided or ask for more money if there is not enough. The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.


---

developer's notes:

console code reloading

load "lib/vending_machine/machine.rb"

---

bugs:

- machine: don't return as change coins that you don't have