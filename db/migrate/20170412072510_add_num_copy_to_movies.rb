class AddNumCopyToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :num_copy, :integer
    add_column :movies, :filetype, :string
  end
end
