class RemoveDoBfromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :DOB
  end
end
