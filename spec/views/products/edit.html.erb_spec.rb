require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = create(:product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

    assert_select "input[name=?]", "product[title]"

    assert_select "textarea[name=?]", "product[description]"

    assert_select "input[name=?]", "product[image_url]"

    assert_select "input[name=?]", "product[price]"
    end
  end
end
