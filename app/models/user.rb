class User < ActiveRecord::Base
   has_many :loanedbooks, :class_name => "LoanedBook"

  attr_accessible :limit, :name, :regno

  validates :name ,:presence => true,
  				  :length => {:minimum => 4}

  validates :regno ,:presence => true,
  					:length => {:minimum => 4}	  				  

  validates :limit ,:presence => true,
  				   :numericality => {:greater_than => 0,
  				                     :only_integers => true
  				                      }   					


  def loan_book(book_id)

    loan = self.loanedbooks.create :book_id => book_id , :start => DateTime.now , :end => DateTime.now + 15.days
    rescue => ex
      self.errors[:base] = 'Cannot Load Book ' + ex.message

  end

end
