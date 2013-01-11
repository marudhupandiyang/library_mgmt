class TagsController < ApplicationController


  def index
  	@tags = Tag.paginate(:page => params[:page] , :per_page => 1)
  end

  def create
  	@tag = Tag.new(params[:tag])

  	if @tag.save
  		flash.notice = "Created Sucessfully"
  		render :show
  	else
  		flash.now[:notice] = "Creation Failed"
  		render :edit
  	end

  end

  def destroy
  	tag = Tag.find(params[:id])
  	
  	
    if tag.destroy
      flash.notice = 'Tag Deleted Sucessfully'
      @tags = Tag.paginate(:page => params[:page] , :per_page => 1)
      render :index
    else
      flash.now[:notice] = 'Tag Not Deleted'
      render :show
    end
  end
  

  def new
  	@tag = Tag.new
  end

  def show 
  	@tag = Tag.find(params[:id])

  end

  
  def update
  	@tag = Tag.find(params[:id])

  	if @tag.update_attributes(params[:tag])
  		flash.notice = "Updated Sucessfully"
  		render :show
  	else
  		flash.now[:notice] = "Update Failed"
  		render :edit
  	end

  end

end
