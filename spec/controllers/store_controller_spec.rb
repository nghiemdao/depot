require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      product_1 = create(:product, title: 'Product 1')
      product_2 = create(:product, title: 'Product 3')
      product_3 = create(:product, title: 'Product 2')

      get :index
      expect(response).to have_http_status(:success)
      
      products = assigns(:products)
      expect(products).to eq([product_1, product_3, product_2])
    end
  end

end
