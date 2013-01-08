class LoanedBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  attr_accessible :book_id, :end, :returned, :start

  before_save lambda {self.returned = false }


end
