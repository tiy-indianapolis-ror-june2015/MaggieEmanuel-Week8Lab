class AddColumnsToOrderItems < ActiveRecord::Migration
  def change

  add_column :order_items, :cart_id, :integer 

  end
end
