class AddReturneddojToLoanedBook < ActiveRecord::Migration
  def change
    add_column :loaned_books, :returneddoj, :datetime
  end
end
