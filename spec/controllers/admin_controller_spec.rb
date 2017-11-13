require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe "GET #index" do
    setup

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  it "should not access without login" do
    get :index
    
    expect(response).to redirect_to login_url
  end
end
