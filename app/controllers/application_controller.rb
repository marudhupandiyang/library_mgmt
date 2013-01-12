class ApplicationController < ActionController::Base
  protect_from_forgery

  #check for authentication or else redirect
	before_filter :authenticate_auth!

  #set the layout for ajax
  layout :getlayout


  #if ajax set no layout to render only the data
  def getlayout
 
  	if request.xhr?
  		false
  	else
  		'application'
  	end
  end

  

  
  
end
