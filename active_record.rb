require "pry"
require "active_record"

# Setup a database connection
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/students.sqlite"
)

# Create a Students table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL
ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have the Student class inherit from ActiveRecord::Base
class Student < ActiveRecord::Base
end

# binding.pry
# ""

# Retrieve a list of all the columns in the table:
Student.column_names

# Create a new Student entry in the database
Student.create(name: 'Jon')

# Return all the records from the students table as instances of the Student class
Student.all

# Retrieve a Student from the database by id
Student.find(1)

# Find by any attribute, such as name
Student.find_by(name: 'Jon')
student.name
student.save