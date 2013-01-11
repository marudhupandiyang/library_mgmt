class AddQuantityToBook < ActiveRecord::Migration
  def change
    add_column :books, :quantity, :integer
  end
end
