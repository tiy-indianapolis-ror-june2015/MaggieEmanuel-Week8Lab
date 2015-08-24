class OrderItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    if @cart.products.include?(@product)
      order_item = @cart.order_items.find_by_product_id(@product.id)
      order_item.quantity = order_item.quantity + 1
      order_item.save!
    else
      @cart.products << @product
    end
      redirect_to :back, :notice => "#{@product.name} added to your cart."
  end


end
