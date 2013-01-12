class AuthsController < ApplicationController

	#Opened the Auth controller again to add these functions to display the user
  def index
    @users = Auth.paginate(:page => params[:page] , :per_page => 1)
  end

  def show
    @user = Auth.find(params[:id])
  end

end