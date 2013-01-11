class AdminController < ApplicationController

	#this shows the dashboard
  def index

		dashboardDetails(DateTime.now)
  end

  #show all the books by title
  def show
  	@books = Book.find_all_by_title(params[:book_name])
  end

  #add book called via post
def addbook
    book= Book.find(params[:id])
  	 if book.add_book(Integer(params[:count])) 
     
     render :inline => 'Books added Sucessfully'

  	#flash.now[:notice] = 'Books added Sucessfully'
  	#render :index 
  else
     render :inline => 'Books not Added'

  end
end

def issuebook
end


#call dashboard with dates	
def dashboardDetails(dte)
	@books_borrowed = Transcation.where('start >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'' ).count.to_s
	@books_returned = Transcation.where('returned = true and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@books_pending =  Transcation.where('returned = false and end  between  \'' + (dte - 7).strftime("%Y-%m-%d")  + '\' and \'' + dte.strftime("%Y-%m-%d") + '\'' ).count.to_s
	
	@new_books = Book.where('created_at >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@new_users = User.where('created_at  >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@active_users = Transcation.where('start >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\' and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'').count.to_s
end

end


