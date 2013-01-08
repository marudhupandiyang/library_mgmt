class Author < ActiveRecord::Base
	has_and_belongs_to_many :books
  attr_accessible :lastbook, :name

  validates :name , :presence => true ,
  					:length => {:minimum => 4}


  before_save lambda{ self.lastbook = -1 } , :if => :new_record?
end
