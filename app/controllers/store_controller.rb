class StoreController < ApplicationController
  def index
    @products = Product.ordered_by_title
  end
end
