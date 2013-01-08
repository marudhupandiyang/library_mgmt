class AdminController < ApplicationController
  def index

  	unless (params[:book_name].nil?) 
  		@books = Books.find_by_title(params[:book_name])
  	end
  	
  end

  def show
  	@books = Books.find_by_title(params[:book_name])
  end

end
