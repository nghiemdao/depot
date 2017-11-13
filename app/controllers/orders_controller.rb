class OrdersController < ApplicationController
  include CurrentCart

  skip_before_action :authorize, only: [:show, :new, :create]
  before_action :set_cart
  before_action :ensure_cart_isnt_empty, only: :new

  def index
    @orders = Order.ordered
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderMailer.received(@order).deliver_later

        format.html { redirect_to store_index_url, notice: 
          'Thank you for your order.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end

  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: 'Your cart is empty'
    end
  end
end
