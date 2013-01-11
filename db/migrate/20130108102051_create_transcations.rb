class CreateTranscations < ActiveRecord::Migration
  def change
    create_table :transcations do |t|
      t.references :user
      t.integer :book_id
      t.datetime :start
      t.datetime :end
      t.boolean :returned, :default => false

      t.timestamps
    end
    add_index :transcations, :user_id
  end
end
