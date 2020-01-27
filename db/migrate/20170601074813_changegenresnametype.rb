class Changegenresnametype < ActiveRecord::Migration[5.0]
  def change
    change_column :genres, :name, :string
  end
end
