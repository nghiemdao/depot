require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'Authozie' do
    setup

    it "GET #index" do 
      orders = create_list(:order, 3)

      get :index

      expect(response).to be_success
      expect(assigns(:orders)).to eq(orders.reverse)
    end
  end

  it "requires item in cart" do
    get :new

    expect(response).to redirect_to store_index_url
    expect(flash[:notice]).to eq('Your cart is empty')
  end
end
