require 'rails_helper'

RSpec.feature "CreateANewUsers", type: :feature do
  setup
  
  it "success" do
    visit new_user_path

    fill_in "user[name]", with: 'foo'
    fill_in "user[password]", with: 'foobar'
    fill_in "user[password_confirmation]", with: 'foobar'
    click_on 'Create User'

    expect(page).to have_current_path users_path
    expect(page).to have_content 'foo'
  end
end
