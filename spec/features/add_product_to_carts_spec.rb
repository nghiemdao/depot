require 'rails_helper'

RSpec.feature "AddProductToCarts", type: :feature do
  it "should add product to cart" do
    product = create(:product)

    3.times do 
      visit store_index_url
      
      first('.button_to input[type=submit]').click
    end

    assert_selector 'h2', text: 'Your Pragmatic Cart'
    assert_selector 'li', text: "3 × #{product.title}"
  end
end
