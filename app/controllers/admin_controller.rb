class AdminController < ApplicationController

  def index

  end

  def show
  	@books = Book.find_all_by_title(params[:book_name])
  end

  def addbook
  	(Book.find(params[:book_id])).add_book(Integer(params[:book_count]))
  	flash.now[:notice] = 'Books added Sucessfully'
  	render :index 
  end

end