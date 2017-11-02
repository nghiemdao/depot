class StoreController < ApplicationController
  include CurrentCart

  before_action :set_cart
  
  def index
    @products = Product.ordered_by_title
  end
end
