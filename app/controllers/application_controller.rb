class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :getlayout

  def getlayout
  	puts "\n\nTest "
  	puts request.inspect

  	puts "\n\nTest "

  	if request.xhr?
  		false
  	else
  		'application'
  	end
  end

  

  
  
end
