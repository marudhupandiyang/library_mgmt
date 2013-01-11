class AddAdminFlagEnabledFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean ,:default => false
    add_column :users, :enabled, :boolean ,:defaul => true
  end
end
