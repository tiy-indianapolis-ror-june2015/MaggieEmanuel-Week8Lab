class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :customer_id
      t.boolean :active
      t.integer :price
      t.string :photo
      t.string :permalink

      t.timestamps null: false
    end
  end
end
