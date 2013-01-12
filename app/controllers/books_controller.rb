
class BooksController < ApplicationController

  #RESTful methods names and their default explanations

  def index
    @books = Book.paginate(:page => params[:page] , :per_page => 2)
  end

  def new
    @book = Book.new
    @tags = Tag.all

  end

  def create
    @book = Book.new(params[:book])
    
    if @book.save
        flash.notice ='Created Sucessfully'
        render :show
    else
        flash.now[:notice] ='Creation Failed'
        render :new
    end


  end

  def edit
    @book = Book.find(params[:id])
  end


  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
        flash.notice ='Updated Sucessfully'
        render :show
    else
        flash.now[:notice] ='Update Failed'
        render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])
   

  if book.destroy
      flash.notice = 'Book Deleted Sucessfully'
      @books = Book.paginate(:page => params[:page] , :per_page => 2)
      render :index
    else
      flash.now[:notice] = 'Book Not Deleted'
      render :show
    end


  end


  #search form action
  #call another fucntion to perform search again..
  #displays the search result

  def search

    if params[:query].present?

      @result = search_book(params[:query])


      render :partial => 'searchresult' , :layout => false #,:content_type => :json

    end

  end

  #fucntion to searcfh  can change as we wish later..

  def search_book(query)

    @book = Book.where("title like ?" , query + '%')

    @book

  end

end



# <%  if @result.present? %>

#     <% @result.each do |book|%>
#       Title: <%= book.title %> <br/>
#       Cost <%= book.price %>
#       <br/>
#       Authors: 
#       <% book.authors.each do |author| %>
#         <li> <%= author.name %> </li>
#       <% end %>
#       <hr/>

#     <% end %>
# <% end %>




#render json authors seperately
  # <% authors = [] %> 

  # <% res.authors.each do |auth|%>
  #   <% authors.push({'name' => auth.name }) %>
  # <% end %>

