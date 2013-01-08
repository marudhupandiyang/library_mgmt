class AddAdminFlagEnabledFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :enabled, :boolean
  end
end
