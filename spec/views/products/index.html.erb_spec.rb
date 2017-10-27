require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      create(:product, title: 'Product 1', description: 'MyText', image_url: '7apps.jpg', price: 9.99),
      create(:product, title: 'Product 2', description: 'MyText', image_url: '7apps.jpg', price: 9.99)
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Product 1".to_s, :count => 1
    assert_select "tr>td", :text => "Product 2".to_s, :count => 1
    assert_select "td>dl>dd", :text => "MyText".to_s, :count => 2
    assert_select "img", :url => "7apps.jpg".to_s, :count => 2
    assert_select "td>dl>dt", :text => "9.99".to_s, :count => 2
  end
end
