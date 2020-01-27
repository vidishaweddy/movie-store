class Cart < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.datetime :return_at
      t.datetime :rent_at
      t.integer :movie_id
      t.integer :user_id
      t.timestamps
    end
    add_foreign_key :carts, :movies
    add_foreign_key :carts, :users
  end
end
