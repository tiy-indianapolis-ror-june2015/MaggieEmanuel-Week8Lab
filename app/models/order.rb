class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
      order_items.collect { |oi| oi.valid ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def add_order_item(product_id)
    order_item = order_items.where('product_id = ?', product_id).first
    if order_item
      order_item.quantity + 1
      save
    else
      order.order_items << Order_Item.new(product_id: product_id, quantity: 1)
    end
    save
  end


  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end


end
