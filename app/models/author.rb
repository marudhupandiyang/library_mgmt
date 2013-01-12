class Author < ActiveRecord::Base
	has_and_belongs_to_many :books
  attr_accessible :lastbook, :name #,:associated
  #attr_accessor :associated

  validates :name , :presence => true ,
  					:length => {:minimum => 4}

  validates :name , :uniqueness => true , :if => :new_record?

  #change the last book to so and so.. so that the author can eaily be linked 
  #to the book lastly accessed by them
  
  before_save lambda{ self.lastbook = -1 } , :if => :new_record?


  # validates_presence_of :books , :unless associated == nil
  # validates_associated :books  ,  :unless associated == nil

end
