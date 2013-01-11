# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


Auth.create([{:email => 'marudhu@devbrother.com' ,:password => 'admin0123', :password_confirmation => 'admin0123' , :name => "Admin" , :limit => 1, :regno => '000000' ,:admin => true}])

Auth.create([{:email => 'marudhu@gmail.com' ,:password => 'test0123', :password_confirmation => 'test0123' , :name => "Marudhu" , :limit => 4, :available => 4, :regno => '123456' ,:admin => true}])



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




book = Book.find(1)
puts 'Available count ' + book.available.to_s

user = Auth.find_by_regno("123456")
puts 'User Name: ' + user.name
puts 'User currently has ' + user.transcations.count.to_s + ' Transcations'

puts 'Issuing ' + book.title + ' book to ' + user.name 

trans = Transcation.new
trans.issue(book.id,user.regno)

puts 'User currently has ' + user.transcations.count.to_s + ' Transcations'

book = Book.find(1)
puts 'Books available count is ' + book.available.to_s


puts 'Admin adds 10 more books '
book = Book.find_by_title('Harry Potter')
book.add_book(10)

book = Book.find_by_title('Harry Potter')
puts 'Current available count is : ' + book.available.to_s


puts 'Student Returns a book'
trans = Transcation.find(1)

trans.return_book(book.id)

user = User.find(User.find_by_name("Marudhu"))

book = Book.find(1)
puts 'Books available count is ' + book.available.to_s

puts 'Status of TranscaTions'
user.transcations.each do |loan|
	puts loan.returned.to_s + ' '
end

puts 'Finding Books by Categories'

Category.all.each do |cat|
	puts 'Category Name: ' + cat.name.to_s
	puts 'This category has ' + cat.books.count.to_s + ' books'
end


puts 'Finding Books by Tags'

Tag.all.each do |tag|
	puts 'Tag Name: ' + tag.name
	puts 'This tag has ' + tag.books.count.to_s + ' books'
end

