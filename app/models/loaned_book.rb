class LoanedBook < ActiveRecord::Base
  belongs_to :user

  attr_accessible :book_id, :end, :returned, :start

  before_save lambda {self.returned = false }


end
