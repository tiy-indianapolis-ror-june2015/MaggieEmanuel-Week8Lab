class Product < ActiveRecord::Base
  include Payola::Sellable

  belongs_to :customer
  has_many :order_items
  default_scope { where(active: true)}

end
