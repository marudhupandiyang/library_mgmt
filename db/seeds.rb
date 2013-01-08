# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create([{:name => "admin" , :limit => 1, :regno => '123456' ,:admin => true}])

user = User.create([{:name => "Marudhu" , :limit => 4, :regno => '08MS134'}])


book = Book.create([{:title => 'Harry Potter' , :page => 250 , :count => 10 ,:price => 100}, {:title => 'Basic C' , :page => 150 , :count => 10 ,:price => 30}, {:title => 'Basic C plus plus' , :page => 170 , :count => 10 ,:price => 50}	])

#add a category for story books
book = Book.find_by_title('Harry Potter')

puts 'Inspecting Found book'
puts book.inspect

category = book.categories.new
category.name = 'Stories'

tag = book.tags.new
tag.name= 'HarryPotter'

book.categories.build
book.tags.build
book.save


#add categories ,tags for Programming
book = Book.find_by_title('Basic C')

category = book.categories.new
category.name = 'Programming'

tag = book.tags.new
tag.name = 'C'

book.categories.build
book.tags.build
book.save


#add categories ,tags for Programming
book = Book.find_by_title('Basic C plus plus')

category = book.categories.new
category.name = 'Programming'

tag = book.tags.new
tag.name = 'C plus plus'


book.categories.build
book.tags.build
book.save

puts 'Admin adds 10 more books '
book = Book.find_by_title('Harry Potter')
book.add_book(10)

