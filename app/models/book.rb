class Book < ActiveRecord::Base

  #associations
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :tags

  has_many :transcations #,:source => 'LoanedBook'

  has_many :auths ,:through => :transcations ,:foreign_key => 'user_id'
  #attributes
  attr_accessible :page, :title, :available, :price ,:quantity ,:category_ids, :tag_ids , :author_ids


  #validations

  validates :title ,:length => {:minimum => 3 },
                      :presence => true,
                      :format  => {:with => /\A[a-z0-9 ]+\Z/i , :message => 'can contain only Alphabets,Numbers and spaces'}

  validates :title , :uniqueness => true , :if => :new_record?


  validates :page , :numericality => {:only_integer => true , :greater_than => 0},
                    :presence => true

  validates :available , :unless => :new_record?, 
                          :numericality => {:greater_than_or_equal_to => 0 ,
                                            :only_integer => true}

  validates :price , :presence => true , :numericality => {:greater_than_or_equal_to => 0}
  validate  :quantity , :present => true  , :numericality => {:greater_than_or_equal_to => 0}
  
  
  #validate that atleast one author must be present

  validates_presence_of :authors
  validates_presence_of :categories
  validates_presence_of :tags

  validates_associated :authors
  validates_associated :categories
  validates_associated :tags

  #call backs

  #set authors last book to this..
  after_save :author_increment

  #check available..
  before_save do 
    
            # authors.each do |author|
            #     author.associated = 1
            # end
          self.available = self.quantity  if self.new_record?
  end 


  
  #add the desired quantity to the book
  def add_book(quantity)
    
      #increase the quantity and available for loaning
        self.quantity += quantity
        self.available += quantity

        #save the model
        self.save
  end

  protected

  #each time the book is saved update the author
  #update the author last book...
  def author_increment

    #loop through all the authors and update the lastbook
  	self.authors.each do |author|

  		author.lastbook = self.id

  		author.save
  	end
  end




end
