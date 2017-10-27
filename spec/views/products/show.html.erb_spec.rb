require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :title => "title",
      :description => "MyText",
      :image_url => "7apps.jpg",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/7apps.jpg/)
    expect(rendered).to match(/9.99/)
  end
end
