class TagsController < ApplicationController


  def index
  	@tags = Tag.all
  end

  def create
  	@tag = Tag.new(params[:tag])

  	if @tag.save
  		flash.notice = "Created Sucessfully"
  		redirect_to tags_path
  	else
  		flash.now[:notice] = "Creation Failed"
  		render :show
  	end

  end

  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy
  	flash.notice = 'Deleted Sucessfully'
  	redirect_to tags_path
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
  		redirect_to tags_path
  	else
  		flash.now[:notice] = "Update Failed"
  		render :show
  	end

  end

end
