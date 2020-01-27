class Posterchange < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :poster_url, :poster
  end
end
