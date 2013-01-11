class Transcation < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  attr_accessible :book_id, :end, :returned, :start ,:user_id , :returneddoj

  before_save :set_returned

  def set_returned

    if self.new_record?
      self.returned = false
    end

  end


   #loan the book to the user
  def issue(book_id,user_id)


    begin
      recheck = Transcation.where('book_id = ' + book_id.to_s + ' and user_id = ' + user_id.to_s + ' and returned =  false' )

      unless recheck.empty?
        puts '  asdfsd'
        puts ''
        puts recheck.inspect
        puts ''
        puts '  asdfsd'
        errors[:base] = 'Already Issued'
        return false
      end
 		#update that the user and decrement the appropiate counter
    self.start =  DateTime.now
    self.end = DateTime.now + 15.days
    self.user = User.find(user_id)
    self.book = Book.find(book_id)
    self.save
    puts '  asdfsd1'
    return true

    rescue => ex
    
      errors[:base] = ex.message + ex.inspect
      return false
    end

  end


   #loan the book to the user
  def reissue

    begin
    #update that the user and decrement the appropiate counter
    
      self.end = DateTime.parse(self.end.to_s) + 15.days
      self.save
      return true
    
    rescue => ex
      errors[:base] = ex.message
      return false
    end

  end
  #find the loan id and return the books 
  #increase the appropriate counters

  def return_book(book_id)

  	#find the loaned book
  	loan = self.transcations.where('book_id = ' + book_id + ' and returned = false')
  	
  
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
