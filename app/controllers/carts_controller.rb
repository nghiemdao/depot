class CartsController < ApplicationController
  include CurrentCart

  before_action :set_cart
  
  def show
    p flash[:notice]
  end
end
