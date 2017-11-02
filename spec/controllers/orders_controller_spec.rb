require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it "requires item in cart" do
    get :new

    expect(response).to redirect_to store_index_url
    expect(flash[:notice]).to eq('Your cart is empty')
  end
end
