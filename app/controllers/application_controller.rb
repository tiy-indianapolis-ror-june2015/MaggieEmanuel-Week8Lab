class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart


  def set_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
