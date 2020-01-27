class FixPriceMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :price_cents
    add_monetize :movies, :price, amount: { null: true, default: nil }
  end
end
