# GETTING USER INPUT AND MAKING HASH TABLE
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please enter a name"
  name = gets.chomp
  puts "Please enter the cohort"
  cohort = gets.chomp
    if cohort == ""
      cohort = "November"
    else
      cohort = cohort
    end
  puts "Please enter a hobby of #{name}"
  hobby = gets.chomp
  puts "Please enter the date of birth of #{name}"
  dob = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, dob: dob}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another set of information from the user
    puts "Please enter a name"
    name = gets.chomp
    puts "Please enter the cohort"
    cohort = gets.chomp
    puts "Please enter a hobby of #{name}"
    hobby = gets.chomp
    puts "Please enter the date of birth of #{name}"
    dob = gets.chomp
  end
  students
end

# HEADER
def print_header
  puts "The students of Villains Academy".center(100,' ')
  puts "-------------".center(100,'-')
end

# PRINTING LIST OF STUDENTS
def print(students)
  students.each_with_index do |student,index|
  puts "#{index} #{student[:name]} (#{student[:cohort]} cohort) likes #{student[:hobby]} and was born on #{student[:dob]}".center(100,' ')
  end
end

# FOOTER
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100,' ')
end

# ASSIGNING NEW HASH TO STUDENTS
students = input_students

print_header
print(students)
print_footer(students)
