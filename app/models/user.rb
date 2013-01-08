class User < ActiveRecord::Base
   has_many :books, :class_name => "LoanedBook" , :through => 

  attr_accessible :limit, :name, :regno, :available

  validates :name ,:presence => true,
  				  :length => {:minimum => 4}

  validates :regno ,:presence => true,
  					:length => {:minimum => 4}	  				  

  validates :limit ,:presence => true,
  				   :numericality => {:greater_than => 0,
  				                     :only_integers => true
  				                      }   	


   before_save lambda{self.available = self.limit} , :if => :new_record?


   #loan the book to the user
  def loan_book(book_id)

	  	
	#find the book
  	book = Book.find(book_id)

  	#check if the book is available else raise error
  	if (book.available == 0 )
  		raise "No Books Available"
	
	#check if the user has space else raise error
  	elsif (self.available == 0 )
  		raise "User has eached his/her limit"
  	else
  		#update that the user and decrement the appropiate counter
	    loan = self.loanedbooks.create :book_id => book_id , :start => DateTime.now , :end => DateTime.now + 15.days
    	book.available -= 1
    	self.available -=1

    	#save the models
    	book.save
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
 