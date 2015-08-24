class Product < ActiveRecord::Base
  has_many :carts, :through => :order_items

end
