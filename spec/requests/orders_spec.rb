require 'rails_helper'

RSpec.describe "Orders", type: :request do
  before(:each) do
    @product = create(:product)
    post line_items_path, params: { product_id: @product.id }
  end

  it "should get new" do
    get new_order_path

    expect(response).to be_success
  end

  it "should create an order" do
    expect {
      post orders_path, params: { order: attributes_for(:order) }
    }.to change(Order, :count).by(1)
    
    expect(response).to redirect_to store_index_url
    expect(flash[:notice]).to eq(I18n.t('.thanks'))
  end

  it "should not create an order" do
    expect {
      post orders_path, params: { order: attributes_for(:order, pay_type: nil) }
    }.to_not change(Order, :count)
  end
end
