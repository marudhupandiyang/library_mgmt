class User < ActiveRecord::Base

   has_many :loaned_books ,:source => 'LoanedBook'
   has_many :books, :through =>  :loaned_books 

  attr_accessible :limit, :name, :regno, :available

  validates :name ,:presence => true,
  				  :length => {:minimum => 4}

  validates :regno ,:presence => true,
  					:length => {:minimum => 4}	  				  

  validates :limit ,:presence => true,
  				   :numericality => {:greater_than => 0,
  				                     :only_integers => true
  				                      }   	
  validates :available , :numericality => {:greater_than_or_equal_to => 0}


   before_save lambda{self.available = self.limit} , :if => :new_record?


   #loan the book to the user
  def loan_book(book_id)

 		#update that the user and decrement the appropiate counter
	    loan = self.loanedbooks.create :book_id => book_id , :start => DateTime.now , :end => DateTime.now + 15.days
	    loan.book.available -= 1
    	self.available -=1

		#save the models
    	loan.book.save
    	loan.save

  	end

  	#rescue the errors
    rescue => ex
      self.errors[:base] = 'Cannot Load Book ' + ex.message

  end

  #find the loan id and return the books 
  #increase the appropriate counters

  def return_book(book_id)

  	#find the loaned book
  	loan = self.loanedbooks.find_by_book_id(book_id)
  	
  	#find the book related to it..
  	book = Book.find(book_id)

  	#increase the appropriate counters
  	book.available += 1
  	self.available += 1

  	#set the book was returned
	loan.returned = true


	#save the models
	loan.save
   	book.save
   	self.save


  end

end
 