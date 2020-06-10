require 'bundler'
Bundler.require

require_relative '../lib/student'

tomas = Student.new
binding.pry

DB = {:conn => SQLite3::Database.new("db/students.db")}
