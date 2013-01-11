class AuthsController < ApplicationController


  def index
    @users = Auth.paginate(:page => params[:page] , :per_page => 1)
  end

  def show
    @user = Auth.find(params[:id])
  end

end