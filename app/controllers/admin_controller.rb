class AdminController < ApplicationController

  def index

		dashboardDetails(DateTime.now)
	
  end

  def show
  	@books = Book.find_all_by_title(params[:book_name])
  end

  def addbook
  	(Book.find(params[:book_id])).add_book(Integer(params[:book_count]))
  	flash.now[:notice] = 'Books added Sucessfully'
  	render :index 
  end

	def dashboardDetails(dte)
		@books_borrowed = LoanedBook.where('start >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'' ).count.to_s
		@books_returned = LoanedBook.where('returned = true and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
		@books_pending =  LoanedBook.where('returned = false and end  between  \'' + (dte - 7).strftime("%Y-%m-%d")  + '\' and \'' + dte.strftime("%Y-%m-%d") + '\'' ).count.to_s
		
		@new_books = Book.where('created_at >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
		@new_users = User.where('created_at  >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
		@active_users = LoanedBook.where('start >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\' and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'').count.to_s
	end

end

