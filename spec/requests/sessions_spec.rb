require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  it "should prompt for login" do
    get login_url
    expect(response).to be_success
  end

  it "should login" do
    user = create(:user, password: 'secret')

    post login_url, params: { name: user.name, password: 'secret' }

    expect(response).to redirect_to admin_url
    expect(session[:user_id]).to eq(user.id)
  end

  it "should fail login" do
    user = create(:user)

    post login_url, params: { name: user.name, password: 'wrong' }

    expect(response).to redirect_to login_url
  end

  it "should logout" do
    delete logout_url

    expect(response).to redirect_to store_index_url
  end
end
