class CategoriesController < ApplicationController

  #RESTful methods names and their default explanations.
  def destroy
    category = Category.find(params[:id])

    if category.destroy
      flash.notice = 'Category Deleted Sucessfully'
      @categories = Category.paginate(:page => params[:page] , :per_page => 1)
      render :index
    else
      flash.now[:notice] = 'Category Not Deleted'
      render :show
    end

  	
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(params[:category])
  
    if @category.save
      flash.notice = 'Created Category Sucessfully'
      render :show
    else
      flash.now[:notice] = 'Creating Category Failed'
      render :edit
    end
  end


  def index
  	@categories = Category.paginate(:page => params[:page] , :per_page => 1)
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash.notice = 'Updated Sucessfully' 
      render :show

    else
      flash.now[:notice] = 'Cannot update. Try again'
      render :edit
    end
  end
end


# <% if params[:page].present? %>


#   $("#categories").html("<%= escape_javascript(render('categories')) %>")


# <% else %>

#   render :partial => 'index.html.erb' , :layout => false
# <% end %>



