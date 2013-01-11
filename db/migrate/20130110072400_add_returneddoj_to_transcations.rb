class AddReturneddojToTranscations < ActiveRecord::Migration
  def change
    add_column :transcations, :returneddoj, :datetime
  end
end
