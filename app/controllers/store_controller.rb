class StoreController < ApplicationController
  include CurrentCart

  skip_before_action :authorize, only: :index
  before_action :set_cart
  
  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.ordered_by_title
    end
  end
end
