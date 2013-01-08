class Book < ActiveRecord::Base
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :tags

  has_many :loaned_books ,:source => 'LoanedBook'

  has_many :users ,:through => :loaned_books

  attr_accessible :page, :title, :available, :price ,:count



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

  after_save :author_increment

  before_save lambda{ self.count = 1 if :count.nil?
                      self.available = self.count
                      } , :if => :new_record?

  #add the desired count to the book
  def add_book(count)
    
      #increase the count and available for loaning
        self.count += count
        self.available += count

        #save the model
        self.save
  end

  protected

  #each time the book is saved update the author
  def author_increment

    #loop through all the authors and update the lastbook
  	self.authors.each do |author|

  		author.lastbook = self.id

  		author.save
  	end
  end




end
