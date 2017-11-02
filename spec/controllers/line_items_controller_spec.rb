require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  it "should create line_item via ajax" do
    product = create(:product)

    expect {
      post :create, params: { product_id: product.id }, xhr: true
    }.to change(LineItem, :count).by(1)
  end
end
