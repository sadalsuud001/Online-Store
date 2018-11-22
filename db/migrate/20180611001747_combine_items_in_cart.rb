class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change
  end
    
  def up
    #for each item in cart
    Cart.all.each do |cart|
        sums.each do | product_id, quantity|
            if quantity > 1
          # remove all items
                cart.lineitems.where(product_id: product_id).delete_all
          # replace with single item
                item = cart.lineitems.build(product_id: product_id)
          # set quantity
                item.quantity = quantity
                item.save!
            end 
        end
    end 
  end
    
end
