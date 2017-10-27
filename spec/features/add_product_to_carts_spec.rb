require 'rails_helper'

RSpec.feature "AddProductToCarts", type: :feature do
  it "should add product to cart" do
    product = create(:product)

    visit store_index_url

    expect {
      first('.button_to input[type=submit]').click
    }.to change(LineItem, :count).by(1)

    assert_selector 'h2', 'Your Pragmatic Cart'
    assert_selector 'li', product.title
  end
end
