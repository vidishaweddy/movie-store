class Addindexes < ActiveRecord::Migration[5.0]
  def change
    add_index :carts, :movie_id
    add_index :carts, :user_id
  end
end
