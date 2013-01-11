class TranscationsController < ApplicationController

  def index
    @transcations = Transcation.paginate(:page => params[:page] , :per_page => 1)
  end

  def new
    @transcation = Transcation.new
  end
  
  def create
    @transcation = Transcation.new
   
   
    if @transcation.issue(params[:transcation][:book_id],params[:regno])
      
      @transcation.save

      flash.now[:notice] = "Issued Book"
      render :show
    else
      flash.now[:notice] = "Failed to issued Book"
      render :new
    end

  end

  def show
    @transcation = Transcation.find(params[:id])
  end

  def edit
    @transcation = Transcation.new
  end

  def update
    @transcation = Transcation.find(params[:id])
    
    @transcation.reissue 

    render :show
  end

  def destroy
    transcation = Transcation.find(params[:id])

    if transcation.destroy
      flash.notice = 'Transcation Deleted Sucessfully'
      @transcations = Transcation.paginate(:page => params[:page] , :per_page => 1)
      render :index
    else
      flash.now[:notice] = 'Transcation Not Deleted'
      render :show
    end

  end

  def search
    if params[:book_id].present? 
      begin
        
        @transcations = Transcation.where("user_id = " + User.find_by_regno(params[:regno]).id.to_s + ' and book_id = ' + params[:book_id]).paginate(:page => params[:page] , :per_page => 100)
        render :index

      rescue => ex
        flash.now[:notice] = ex.message
        puts ex.message

      end

    end

  end

end
