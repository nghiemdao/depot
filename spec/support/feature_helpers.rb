module FeatureHelpers
  def setup
    before(:each) do
      foobar = create(:user, name: 'foobar', password: 'secret')
      
      visit login_url

      fill_in 'name', with: foobar.name
      fill_in 'password', with: 'secret'
      click_on 'Login'
    end
  end
end