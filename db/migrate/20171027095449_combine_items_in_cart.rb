class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product_id: product_id).destroy_all
          cart.line_items.create!(product_id: product_id, quantity: quantity)
        end
      end
    end 
  end
  
  def down
    LineItem.where('quantity > 1').each do |item|
      item.quantity.times do
        LineItem.create(product_id: item.product_id, cart_id: item.cart_id, quantity: 1)
      end
      item.destroy
    end
  end
end
