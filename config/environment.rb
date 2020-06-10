require 'bundler'
Bundler.require

require_relative '../lib/student'

tomas = Student.new("Thomas", 20)
binding.pry

DB = {:conn => SQLite3::Database.new("db/students.db")}
