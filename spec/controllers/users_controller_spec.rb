require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  setup 
  
  it "should create user" do
    expect {
      post :create, params: { user: attributes_for(:user) }
    }.to change(User, :count).by(1)
    p response.body
    expect(response).to redirect_to users_url
  end

  it "should not create user" do
    expect {
      post :create, params: { user: attributes_for(:user, name: nil) }
    }.not_to change(User, :count)

    expect(response).not_to redirect_to users_url
  end

  it "should update user" do
    user = create(:user)

    patch :update, params: { id: user.to_param, 
      user: { password: 'secret', password_confirmation: 'secret' } }
    
    expect(response).to redirect_to users_url
  end

  it "should not update user" do
    user = create(:user)
    
    patch :update, params: { id: user.to_param, user: { name: '' } }
    
    expect(response).not_to redirect_to users_url
  end

  it "should destroy user" do
    user = create(:user)

    expect {
      delete :destroy, params: { id: user.to_param }
    }.to change(User, :count).by(-1)
  end
end
