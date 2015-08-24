class AddColumnsToCart < ActiveRecord::Migration
  def change

    add_column :carts, :name, :string, default: "Shopping Cart"
    add_column :carts, :permalink, :string

    change_column :carts, :price, :integer, default: 0


  end
end
