# FINDING THE ERRORS CHALLENGE
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

# CREATING EMPTY ARRAY

  students = []

# GETTING FIRST NAME

  name = gets.chomp

  while !name.empty? do
# ADDING THE HASH TO THE ARRAY
  students << {name: name, cohort:  :november}
  puts "Now we have #{students.count} students"
# get another name from the user
  name = gets.chomp
  end
# return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
if students.count > 0
  print_header
  print(students)
  print_footer(students)
else
  # do nothing as there are no students
end
