# Vending Machine

Vending machine exercise

### Installing

ruby 1.9+ is required, i use 2.1 but any will be ok

    bundle

---

### Running (console)

Sample running session:

    irb -r ./config/env.rb
    
    >>

    include VendingMachine
    
    m = Machine.new
    
    m.stock.products # note there is one lemonade
    
    m.transaction do |t|
      t.product_select  Product.new("lemonade")
      t.coins_insert    Coin.new("50p")
    end
    
    m.stock.products
    
    
see the specs (especially transaction_spec) to see all callable methods

---
 
### Specs

run specs with:

    rspec
   
---

problem in extended text form  

The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. It should also return change if too much money is provided or ask for more money if there is not enough. The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.


---

bugs & stuff left to implement:

- don't return (as change) coins that are not in the machine
- don't return products that you don't have in stock
- use recursion to provide more than one coin as change (I can implement this if you want me to, just drop me an email)

I think that it's all

note: in a real production environment I'd add more complex specs to cover all edge cases and provide full implementation of everything, for this exercise I think it's enough