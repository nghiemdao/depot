require 'rails_helper'

RSpec.describe "Carts", type: :request do
  it "should destroy cart" do
    product = create(:product)
    post line_items_url, params: { product_id: product.id }
    @cart = Cart.find(session[:cart_id])

    expect {
      delete cart_url(@cart)
    }.to change(Cart, :count).by(-1)

    assert_redirected_to store_index_url
  end
end
