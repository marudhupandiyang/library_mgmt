class AddCountToBook < ActiveRecord::Migration
  def change
    add_column :books, :count, :integer
  end
end
