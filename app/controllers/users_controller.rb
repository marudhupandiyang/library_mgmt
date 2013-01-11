class UsersController < ApplicationController
  
    def destroy
    user = User.find(params[:id])
    
    if user.destroy
      flash.notice = 'User Deleted Sucessfully'
      @users = User.paginate(:page => params[:page] , :per_page => 1)
      render :index
    else
      flash.now[:notice] = 'User Not Deleted'
      render :show
    end

  end

  def new
    @user = User.new
  end

  def create

    @user = User.new params[:user]

    if @user.save
      flash.notice = 'User Added Sucessfully'
      render :show
    else
      
      flash.now[:notice] = 'User Not Added'
      render :new
    end
  end

  def index
    @users = User.paginate(:page => params[:page] , :per_page => 1)
  end

  def edit
    @user = User.find(params[:id])
  end
    
  def show
    @user = User.find(params[:id])
  end


  def update
      @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
        flash.notice = 'Updated Sucessfully' 
        render :show

      else
        flash.now[:notice] = 'Cannot update. Try again'
        render :edit
      end
  end

end
