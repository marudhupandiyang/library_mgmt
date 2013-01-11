class AddDetailsToAuth < ActiveRecord::Migration
  def change
    add_column :auths, :name, :string
    add_column :auths, :regno, :string
    add_column :auths, :limit, :integer
    add_column :auths, :available, :integer
    add_column :auths, :admin, :boolean
    add_column :auths, :enabled, :boolean
  end
end
 