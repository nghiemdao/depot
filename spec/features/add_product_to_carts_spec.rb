require 'rails_helper'

RSpec.feature "AddProductToCarts", type: :feature do
  setup

  it "should add product to cart" do
    product = create(:product)

    3.times do 
      visit store_index_url
      
      first('.entry .button_to input[type=submit]').click
    end

    assert_selector 'h2', text: 'Your Cart'
    assert_selector 'td', text: product.title
  end
end
