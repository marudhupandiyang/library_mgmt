class Author < ActiveRecord::Base
	has_and_belongs_to_many :books
  attr_accessible :lastbook, :name #,:associated
  #attr_accessor :associated

  validates :name , :presence => true ,
  					:length => {:minimum => 4}

  validates :name , :uniqueness => true , :if => :new_record?

  before_save lambda{ self.lastbook = -1 } , :if => :new_record?


  # validates_presence_of :books , :unless associated == nil
  # validates_associated :books  ,  :unless associated == nil

end
