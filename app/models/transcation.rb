class Transcation < ActiveRecord::Base
  belongs_to :auth ,:foreign_key => 'user_id'
  belongs_to :book

  attr_accessible :book_id, :enddte, :returned, :startdte ,:user_id , :returneddoj

  before_save :set_returned

   def set_returned

    if self.new_record?
      self.returned = false

    end
    true
   end

   #loan the book to the user
  def issue(book_id,regno)


    student = Auth.find_by_regno(regno)
    begin
      
      recheck = Transcation.where('book_id = ' + book_id.to_s + ' and user_id = ' + student.id.to_s + ' and returned =  false' )

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
    self.startdte =  DateTime.now
    self.enddte = DateTime.now + 15.days
    self.auth = Auth.find_by_regno(regno)
    self.book = Book.find(book_id)

    self.book.available -=1 
    self.auth.available -=1
    self.book.save
    self.save

    puts '  asdfsd1 ' + errors.full_messages.to_s + " -- " + self.new_record?.to_s + "--" + self.inspect.to_s
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
    
      self.enddte = DateTime.parse(self.end.to_s) + 15.days
      self.save
      return true
    
    rescue => ex
      errors[:base] = ex.message
      return false
    end

  end
  #find the loan id and return the books 
  #increase the appropriate counters

  def return_book

  	self.book.available += 1
    self.auth.available +=1
  	
  	#set the book was returned
	  self.returned = true
	  self.returneddoj = DateTime.now


	#save the models
	  self.book.save
    self.auth.save
   	self.save

    true
  end


end
