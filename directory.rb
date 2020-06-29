# All the students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# Printing the list of students
puts "The students of Villains Academy"
puts "-------------"
students.each do |name|
  puts name
end
# Print total
puts "Overall, we have #{students.count} great students"
