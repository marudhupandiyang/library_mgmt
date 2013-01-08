class Tag < ActiveRecord::Base
	has_and_belongs_to_many :books
  attr_accessible :name

  validates :name , :length => {:minimum => 1 },
                      :presence => true

end
