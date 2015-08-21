class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :tax
      t.integer :total
      t.references :order_status

      t.timestamps null: false
    end
  end
end
