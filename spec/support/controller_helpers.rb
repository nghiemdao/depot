module ControllerHelpers
  def setup
    before(:each) do
      foobar = create(:user, name: 'foobar')
      session[:user_id] = foobar.id
    end
  end
end