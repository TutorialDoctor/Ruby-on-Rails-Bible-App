require 'sqlite3'
#https://rubyplus.com/articles/1141-SQL-Basics-SQLite3-Ruby-Driver-Basics
#http://ruby.bastardsbook.com/chapters/sql/

db = SQLite3::Database.new('bible-sqlite.db')
books = db.execute <<-SQL 
          SELECT * FROM key_english;
        SQL
print books
puts

def list_books(x)
  x.each do |book|
    book_number = book[0]
    book_name = book[1]
    puts book_number.to_s + ": " + book_name
  end
end

list_books(books)

=begin
rows = db.execute <<-SQL 
          create table users(
           id int,
           name varchar(30)
         );
        SQL

#puts rows
#puts rows.inspect

db.execute("INSERT INTO users(id, name) VALUES(?, ?)", [1, 'Bugs Bunny'])

records = {2 => 'Daffy Duck', 3 => 'Porky Pig'}           

records.each do |record|
  db.execute("INSERT INTO users(id, name) VALUES(?, ?)", record)  
end

puts records

db.execute("select * from users") do |result|
  puts result
end

puts 'space'

db.execute 'SELECT * FROM users' do |row|
  puts row
end
=end

