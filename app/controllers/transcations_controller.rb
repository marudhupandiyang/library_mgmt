class TranscationsController < ApplicationController

#RESTful methods names and their default explanations
#to perform the borrwing , reissuing and retrunin books..

  #show all trancations
  def index
    if current_auth.admin == true
      @transcations = Transcation.paginate(:page => params[:page] , :per_page => 1)
    else
      @transcations = current_auth.transcations.paginate(:page => params[:page] , :per_page => 1)
    end
  end

  #display the form
  def new
    @transcation = Transcation.new
  end
  
  #issuce the book
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

  #wshow the one selected 
  def show
    @transcation = Transcation.find(params[:id])
  end

  #form for reissue
  def edit
    @transcation = Transcation.new
  end

  #reissue function
  def update
    @transcation = Transcation.find(params[:id])
    
    @transcation.reissue 

    render :show
  end

  #Cancel teh trancations
  def destroy
    transcation = Transcation.find(params[:id])

    if transcation.destroy
      flash.notice = 'Transcation Deleted Sucessfully'
      @transcations = Transcation.paginate(:page => params[:page] , :per_page => 1)
      render :index
    else
      flash.now[:notice] = 'Transcation Not Deleted'
      @transcation = transcation
      render :show
    end

  end

  #return book action, custom one
  def returnbook
    @transcation = Transcation.find(params[:id])

    @transcation.return_book 

    render :show
    

  end

  #seach for reissuing book, redirected form teh edit action after
  #filling the form
  
  def search
    if params[:book_id].present? 
      begin
        
        @transcations = Transcation.where("user_id = " + Auth.find_by_regno(params[:regno]).id.to_s + ' and book_id = ' + params[:book_id]).paginate(:page => params[:page] , :per_page => 100)
        render :index

      rescue => ex
        flash.now[:notice] = ex.message
        puts ex.message

      end

    end

  end

end
