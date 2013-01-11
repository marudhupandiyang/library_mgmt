# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create([{:name => "admin" , :limit => 1, :regno => '123456' ,:admin => true}])

user = User.create([{:name => "Marudhu" , :limit => 4, :regno => '08MS134'}])


book = Book.new({:title => 'Harry Potter' , :page => 250 , :quantity => 10 ,:price => 100})


puts book.inspect

book.categories.build({:name => 'Stories'})
book.tags.build({:name => 'Harry Potter'})
book.authors.build({:name => 'Rowling'})
book.save

book = Book.new({:title => 'Basic C' , :page => 150 , :quantity => 10 ,:price => 30})

book.categories.build({:name => 'Programming'})
book.tags.build({:name => 'C'})
book.authors.build({:name => 'Srinivasan'})
book.save



book = Book.new( {:title => 'Basic C plus plus' , :page => 170 , :quantity => 10 ,:price => 50})

book.categories.build({:name => 'Programming'})
book.tags.build({:name => 'C plus plus'})
book.authors.build({:name => 'Rama'})
book.save

puts 'Admin adds 10 more books '
book = Book.find_by_title('Harry Potter')
book.add_book(10)

