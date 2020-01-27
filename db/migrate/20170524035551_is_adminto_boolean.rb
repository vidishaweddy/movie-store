class IsAdmintoBoolean < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :isAdmin
    add_column :users, :admin, :bool
  end
end
