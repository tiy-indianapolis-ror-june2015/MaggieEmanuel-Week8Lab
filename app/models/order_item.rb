class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :cart_present


  def total_price
    quantity * product.price
  end

  def update_cart_total
    cart.price = cart.reload.order_items.collect{|order| order.total_price}.inject(:+)
    car.save!
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def cart_present
    if cart.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

end
