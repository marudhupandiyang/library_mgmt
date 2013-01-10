class AuthorsController < ApplicationController

	def destroy

		if Author.destroy(params[:id])
			flash.notice = 'Author Deleted Sucessfully'
			redirect_to  root_path
		else
			flash.now[:notice] = 'Author Not Deleted'
			render :new_Author
		end

	end

	def new
		@author = Author.new
	end

	def create

		@author = Author.new params[:author]

		if @author.save
			flash.notice = 'Author Added Sucessfully'
			redirect_to  root_path
		else
			
			flash.now[:notice] = 'Author Not Added'
			render :new_Author
		end
	end

	def index

	end
	  
	def show
		@author = Author.find(params[:id])
	end


	def update
	    @author = Author.find(params[:id])

	    if @author.update_attributes(params[:author])
	      flash.notice = 'Updated Sucessfully' 
	      redirect_to authors_path
	    else
	      flash.now[:notice] = 'Cannot update. Try again'
	      render :show
	    end
	end

end