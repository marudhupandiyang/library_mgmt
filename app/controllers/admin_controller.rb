class AdminController < ApplicationController


	#this shows the dashboard
  def index
    if current_auth.admin == true 

		  admin_dashboard_Details(DateTime.now)
    else
      user_dashboard_Details(DateTime.now)
    end
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



#call dashboard with dates	
def admin_dashboard_Details(dte)
	@books_borrowed = Transcation.where('startdte >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'' ).count.to_s
	@books_returned = Transcation.where('returned = true and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@books_pending =  Transcation.where('returned = false and enddte  between  \'' + (dte - 7).strftime("%Y-%m-%d")  + '\' and \'' + dte.strftime("%Y-%m-%d") + '\'' ).count.to_s
	
	@new_books = Book.where('created_at >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@new_users = Auth.where('created_at  >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
	@active_users = Transcation.where('startdte >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\' and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'').count.to_s
end

def user_dashboard_Details(dte)
  @books_borrowed = current_auth.transcations.where('startdte >= \'' + (dte - 7).strftime("%Y-%m-%d") + '\'' ).count.to_s

  @books_returned = current_auth.transcations.where('returned = true and returneddoj >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s
  @books_pending =  current_auth.transcations.where('returned = false and enddte  between  \'' + (dte - 7).strftime("%Y-%m-%d")  + '\' and \'' + dte.strftime("%Y-%m-%d") + '\'' ).count.to_s
  
  @allbooks_pending =  current_auth.transcations.where('returned = false ' ).count.to_s

  @new_books = Book.where('created_at >= \'' + (dte - 7).strftime("%Y-%m-%d")  + '\'' ).count.to_s

end

end


