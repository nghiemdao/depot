class CartsController < ApplicationController
  skip_before_action :authorize, only: [:show, :destroy]

  before_action :set_cart
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  
  def show; end

  def destroy
    @cart.destroy if params[:id].to_i == session[:cart_id].to_i
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to store_index_url }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempts to access invalid cart #{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid cart'
  end
end
