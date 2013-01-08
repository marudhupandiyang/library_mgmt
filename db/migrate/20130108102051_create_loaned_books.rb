class CreateLoanedBooks < ActiveRecord::Migration
  def change
    create_table :loaned_books do |t|
      t.references :user
      t.integer :book_id
      t.datetime :start
      t.datetime :end
      t.boolean :returned

      t.timestamps
    end
    add_index :loaned_books, :user_id
  end
end
