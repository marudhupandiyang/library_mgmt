class CategoriesController < ApplicationController


  def destroy

    Category.destroy(params[:id])
    redirect_to categories_path
  	
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(params[:category])
  
    if @category.save
      flash.notice = 'Created Category Sucessfully'
      redirect_to categories_path
    else
      flash.now[:notice] = 'Creating Category Failed'
      render :show
    end
  end


  def index
  	@categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash.notice = 'Updated Sucessfully' 
      redirect_to categories_path
    else
      flash.now[:notice] = 'Cannot update. Try again'
      render :show
    end
  end
end
