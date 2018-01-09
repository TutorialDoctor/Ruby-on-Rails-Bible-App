require 'sqlite3'


class NotesController < ApplicationController
  def index
    @notes = Note.all
    #https://rubyplus.com/articles/1141-SQL-Basics-SQLite3-Ruby-Driver-Basics
    #http://ruby.bastardsbook.com/chapters/sql/

    db = SQLite3::Database.new('db/bible-sqlite.db')
    @all_books = db.execute <<-SQL 
          SELECT * FROM key_english;
        SQL
    @text = db.execute <<-SQL 
          SELECT c,v,t FROM t_kjv WHERE b='45' AND c='1';
        SQL
  end
  
  def new
  end
end
