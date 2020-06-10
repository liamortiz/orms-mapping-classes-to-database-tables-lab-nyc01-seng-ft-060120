# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]
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
    
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
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
  
  def self.create(hash)
    new_student = Student.new(hash[:name], hash[:grade])
    new_student.save
    new_student
  end
end
