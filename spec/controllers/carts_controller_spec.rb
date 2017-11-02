require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  it "invalid cart" do
    get :show, params: { id: 'wibble' }

    expect(response).to redirect_to store_index_url
  end
end