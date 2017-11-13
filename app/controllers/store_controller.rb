class StoreController < ApplicationController
  include CurrentCart

  skip_before_action :authorize, only: :index
  before_action :set_cart
  
  def index
    @products = Product.ordered_by_title
  end
end
