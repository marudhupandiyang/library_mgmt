class Auth < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me 


  # attr_accessible :title, :body

  #my own

  #asscociations

  has_many :transcations  ,:foreign_key => "user_id"
  has_many :books, :through =>  :transcations

  #my own attrs
  attr_accessible :limit, :name, :regno, :available, :admin, :enabled ,:returned 

  #validations
  validates :name ,:presence => true,
  				  :length => {:minimum => 4}

  validates :regno ,:presence => true,
  					:length => {:minimum => 4}	  				  

  #validates :limit ,:presence => true,   				   :numericality => {:greater_than => 0,  				                     :only_integers => true   				                      }   	
  validates :available , :numericality => {:greater_than_or_equal_to => 0} , :unless => :new_record?

  before_save :user_defaults

  #set deagult values 
  def user_defaults 
  	if self.new_record?
  		self.available = 4
  		self.available = self.limit
  		self.enabled=true if self.enabled.nil?
  		self.admin =false if self.admin.nil?
	end
	
	true
	  end
=begin
   before_save lambda{self.available = self.limit
                      self.admin = false if self.admin.nil?
                      self.enabled = true  if self.enabled.nil?
                      } , :if => :new_record?

=end


end
