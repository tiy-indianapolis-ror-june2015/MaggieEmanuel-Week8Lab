class RemoveColumnFromProducts < ActiveRecord::Migration
  def change

    remove_column :products, :permalink, :string 

  end
end
