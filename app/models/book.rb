class Book < ActiveRecord::Base
	has_and_belongs_to_many :authors
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :tags
  attr_accessible :page, :title


  validates :title ,:length => {:minimum => 3 },
                      :presence => true

  validates :page , :numericality => {:only_integer => true , :greater_than => 0},
                    :presence => true

  after_save :author_increment

  before_save lambda{ self.count = 1} , :if => :new_record?

  def add_book(count)
    
    #if book = Book.find_by_title(title)
        self.count += count
        self.save
    #end

  end

  protected

  def author_increment

  	self.authors.each do |author|

  		author.lastbook = id

  		author.save
  	end

  end




end
