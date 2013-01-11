class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @tags = Tag.all

  end

  def create
    @book = Book.new(params[:book])
    
    if @book.save
        flash.notice ='Created Sucessfully'
        redirect_to books_path
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
        redirect_to books_path
    else
        flash.now[:notice] ='Update Failed'
        render :show
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    flash.notice ='Deleted Sucessfully'

    redirect_to books_path

  end


  def search

    if params[:query].present?

      @result = search_book(params[:query])


      render :partial => 'searchresult' , :layout => false #,:content_type => :json

    end

  end


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

