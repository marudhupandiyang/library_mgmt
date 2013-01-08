class AddAvailableToBooks < ActiveRecord::Migration
  def change
    add_column :books, :available, :integer
  end
end
