class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    line_item = line_items.find_by(product_id: product)

    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(product: product, quantity: 1)
    end

    line_item
  end

  def total_price
    line_items.map(&:total_price).inject(0, :+)
  end
end
