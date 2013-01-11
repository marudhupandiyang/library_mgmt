class AuthorsController < ApplicationController

	def destroy
		author = Author.find(params[:id])
		
		if author.destroy
			flash.notice = 'Author Deleted Sucessfully'
			@authors = Author.paginate(:page => params[:page] , :per_page => 1)
			render :index
		else
			flash.now[:notice] = 'Author Not Deleted'
			render :show
		end

	end

	def new
		@author = Author.new
	end

	def create

		@author = Author.new params[:author]

		if @author.save
			flash.notice = 'Author Added Sucessfully'
			render :show
		else
			
			flash.now[:notice] = 'Author Not Added'
			render :new
		end
	end

	def index
		@authors = Author.paginate(:page => params[:page] , :per_page => 1)
	end

	def edit
		@author = Author.find(params[:id])
	end
	  
	def show
		@author = Author.find(params[:id])
	end


	def update
	    @author = Author.find(params[:id])

	    if @author.update_attributes(params[:author])
	      flash.notice = 'Updated Sucessfully' 
	      render :show

	    else
	      flash.now[:notice] = 'Cannot update. Try again'
	      render :edit
	    end
	end

end