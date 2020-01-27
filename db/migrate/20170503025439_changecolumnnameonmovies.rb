class Changecolumnnameonmovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :rating, :string
    change_column :movies, :rating, 'float USING CAST(rating AS float)'
    change_column :movies, :price, 'integer USING CAST(price AS integer)'
    rename_column :movies, :num_copy, :quantity
    rename_column :movies, :price, :price_cents
  end
end
