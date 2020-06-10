# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]
require 'pry'
class Student
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name, grade, id=0)
    @name = name
    @grade = grade
  end
  
  def save
    
    query = <<-QUERY
      INSERT INTO students(name, grade) VALUES(?, ?)
    QUERY
    
    DB[:conn].execute(query, self.name, self.grade)
  end
  
  def self.create_table
    query = <<-QUERY
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER)
    QUERY
    DB[:conn].execute(query)
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE students")
  end
  
  def self.create
  end
end
