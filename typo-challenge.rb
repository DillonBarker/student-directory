@students = [] # an empty array accessible to all methods

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

def print_students_list
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{students.count} great students"
end

# INTERACTIVE MENU
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
end

interactive_menu