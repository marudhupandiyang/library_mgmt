class User < ActiveRecord::Base

  has_many :transcations #,:source => 'LoanedBook'
  has_many :books, :through =>  :transcations

  attr_accessible :limit, :name, :regno, :available, :admin, :enabled ,:returned

  validates :name ,:presence => true,
  				  :length => {:minimum => 4}

  validates :regno ,:presence => true,
  					:length => {:minimum => 4}	  				  

  validates :limit ,:presence => true,
  				   :numericality => {:greater_than => 0,
  				                     :only_integers => true
  				                      }   	
  validates :available , :numericality => {:greater_than_or_equal_to => 0} , :unless => :new_record?

  before_save lambda{self.available = self.limit}
=begin
   before_save lambda{self.available = self.limit
                      self.admin = false if self.admin.nil?
                      self.enabled = true  if self.enabled.nil?
                      } , :if => :new_record?

=end


end
 
