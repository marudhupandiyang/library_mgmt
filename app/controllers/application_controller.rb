class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate_auth!

  layout :getlayout

  def getlayout
 
  	if request.xhr?
  		false
  	else
  		'application'
  	end
  end

  

  
  
end
