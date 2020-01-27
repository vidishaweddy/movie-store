class Changedobtype < ActiveRecord::Migration[5.0]
  def change
    change_column :actors, :dob, 'date USING CAST(dob AS date)'
  end
end
