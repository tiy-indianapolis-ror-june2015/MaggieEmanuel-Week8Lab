class Cart < ActiveRecord::Base
  include Payola::Sellable

  has_many :order_items
  has_many :products, :through => :order_items

  before_validation :set_permalink, :on => :create

  def set_permalink
    self.permalink = SecureRandom.urlsafe_base64
  end

  def total_quantity
    order_items.sum(:quantity)
  end

  def clear!
    order_items.destroy_all
    update(:price => 0)
  end

end
