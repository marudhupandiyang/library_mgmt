class Category < ActiveRecord::Base
	has_and_belongs_to_many :books
  attr_accessible :name

  validates :name , :length => {:minimum => 3 },
                      :presence => true

end
