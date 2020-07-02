@students = [] # an empty array accessible to all methods

# FINDING THE ERRORS CHALLENGE
def input_students
  puts "Please enter the names, then cohorts of the students"
  puts "To finish, just hit return twice"

# GETTING FIRST NAME

  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp

  while !name.empty? do
# ADDING THE HASH TO THE ARRAY
  students_to_hash(name, cohort)
  puts "Now we have #{@students.count} students"
# get another name from the user
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  end
# return the array of students
  @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# INTERACTIVE MENU
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
end

# SAVING STUDENTS TO A FILE
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# LOADING THE STUDENTS FILE
def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    students_to_hash(name, cohort)
  end
  file.close
end

# METHOD FOR @STUDENTS into a hash
def students_to_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


# TRY LOADING STUDENTS
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
