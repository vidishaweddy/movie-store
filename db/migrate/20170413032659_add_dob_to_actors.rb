class AddDobToActors < ActiveRecord::Migration[5.0]
  def change
    add_column :actors, :dob, :string
  end
end
