class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :getlayout

  def getlayout
 
  	if request.xhr?
  		false
  	else
  		'application'
  	end
  end

  

  
  
end
