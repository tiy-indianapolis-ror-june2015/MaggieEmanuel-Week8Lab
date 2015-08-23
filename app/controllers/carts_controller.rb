class CartsController < ApplicationController


  def show
    @order_items = current_order.order_items
  end

  def add_to_cart
    current_order.add_order_item(params[:product_id])
    redirect_to cart_path(current_order.id)
  end

end
