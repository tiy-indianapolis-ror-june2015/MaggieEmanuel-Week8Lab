class Product < ActiveRecord::Base

  belongs_to :customer

  has_many :order_items

  default_scope { where(active: true)}

end
