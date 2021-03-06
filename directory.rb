@students = [] # an empty array accessible to all methods

# METHOD FOR @STUDENTS into a hash
def students_to_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# FINDING THE ERRORS CHALLENGE
def input_students
  puts "Please enter the names, then cohorts of the students"
  puts "To finish, just hit return twice"
# GETTING FIRST NAME AND COHORT
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  while !name.empty? do
# ADDING THE HASH TO THE ARRAY
  students_to_hash(name, cohort)
  puts "Now we have #{@students.count} students"
# get another name and cohort from the user
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  end
  @students
  puts "You have successfully inputed the students"
end

def print_header
  puts "The students of my cohort at Villains Academy".center(100,' ')
  puts "-------------".center(100,'-')
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100,' ')
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(100,' ')
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
  puts "You have successfully saved the students to a file called students.csv"
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

# TRY LOADING STUDENTS
def try_load_students
  filename = "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
      show_students
  else
    return
  end
end

# RUNNING
try_load_students
interactive_menu
