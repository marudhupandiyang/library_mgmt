module ApplicationHelper

	#return all authors
	def getAuthors
		authors = Author.select("name,id").all()
		authors
	end

	#return all tags
	def getTags
		tags = Tag.select("name,id").all()
		tags
	end


	#return categories
	def getCategories
		categories = Category.select("name,id").all()
		categories
	end


end

