
puts '\n\nAdding a Admin user called admin \n'

user = User.create([{:name => "admin" , :limit => 1, :regno => '123456' ,:admin => true}])

puts '\n\nAdding a user called Marudhu with limit 4\n'

user = User.create([{:name => "Marudhu" , :limit => 4, :regno => '08MS134'}])

puts 'User.all.inspect result\n'
puts User.all.inspect


puts '\n\nAdding a three books\n'

book = Book.create([{:title => 'Harry Potter' , :page => 250 , :count => 10 ,:price => 100}, {:title => 'Basic C' , :page => 150 , :count => 10 ,:price => 30}, {:title => 'Basic C plus plus' , :page => 170 , :count => 10 ,:price => 50}	])

puts '\nBook.errors\n'
book.each do |b|
	b.errors.full_messages
end

puts '\nBook.all.inspect result\n'
Book.all.inspect

puts '\nAdding categories and tags to the books'

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


puts '\nBook.all.inspect result\n'
Book.all.inspect



book = Book.find(1)
puts 'Available count ' + book.available.to_s

user = User.find(User.find_by_name("Marudhu"))
puts 'User Name: ' + user.name
puts 'User currently has ' + user.loaned_books.count.to_s + ' Loaned Books'

puts 'Loaning ' + book.title + ' book to ' + user.name 

user.loan_book(book)

puts 'User currently has ' + user.loaned_books.count.to_s + ' Loaned Books'

book = Book.find(1)
puts 'Books available count is ' + book.available.to_s


puts 'Admin adds 10 more books '
book = Book.find_by_title('Harry Potter')
book.add_book(10)

book = Book.find_by_title('Harry Potter')
puts 'Current available count is : ' + book.available.to_s

puts 'Student Returns a book'
user = User.find(User.find_by_name("Marudhu"))

user.return_book(book.id)

user = User.find(User.find_by_name("Marudhu"))

book = Book.find(1)
puts 'Books available count is ' + book.available.to_s

puts 'Status of Loaned Books'
user.loaned_books.each do |loan|
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

