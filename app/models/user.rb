class User < ActiveRecord::Base

  has_many :loaned_books ,:source => 'LoanedBook'
  has_many :books, :through =>  :loaned_books 

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

   #loan the book to the user
  def loan_book(book)

 		#update that the user and decrement the appropiate counter

    loan = LoanedBook.new
    loan.start =  DateTime.now
    loan.end = DateTime.now + 15.days
    loan.user = self
    loan.book = book
    loan.save

=begin
	    loan = self.loaned_books.new :start => DateTime.now , :end => DateTime.now + 15.days
      loan.book = book
	    loan.book.available -= 1
    	self.available -=1

		#save the models
#    	loan.save
      self.save

  	#rescue the errors
    rescue => ex
      self.errors[:base] = 'Cannot Load Book ' + ex.message
=end

  end

  #find the loan id and return the books 
  #increase the appropriate counters

  def return_book(book_id)

  	#find the loaned book
  	loan = self.loaned_books.where('book_id = ' + book_id + ' and returned = false')
  	
  
    book = Book.find(book_id)#increase the appropriate counters
  	book.available += 1
  	self.available += 1

  	#set the book was returned
	  loan.returned = true
	  loan.returneddoj = DateTime.now


	#save the models
	  loan.save
    book.save
   	self.save


  end

end
 
