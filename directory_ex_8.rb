@students = [] # creates an empty array accessible to all methods

# Step 9: Interactive menu
def interactive_menu
  loop do
    print_menu
    process_menu_choice(gets.chomp)
  end
end

def process_menu_choice(menu_choice)
  case menu_choice
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "not a valid option, please try again"
  end
end

# step 10
def print_menu
  puts "Please select the option you want from below by entering the number"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

# step 10
def show_students
  print_header
  print_student
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get name
  name = gets.chomp
  # while the name is not empty, add a hash to the array
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student
  # ex. 1: print student number before name
  @students.each.with_index(1) { |student, index| 
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

# ex 9
def print_footer
  print "Overall, we have #{@students.count} great student", @students.count > 1 ? "s\n" : "\n"
end

# students = input_students
interactive_menu
# print_header
# print_student(students)
# print_footer(students)

# CODE VARIATIONS

  # # ex. 3: names less than 12 characters
  # students.select { |student|
  #   puts student[:name] if student[:name].length < 12
  # }

  # # ex. 2: names starting with a specific character
  # student_first_letter = students.select { |student|
  #   puts student[:name] if student[:name].start_with?('T')
  # }

  # # original print count
  # def print_footer(names)
  #   puts "Overall, we have #{names.count} great students"
  # end

  # # ex. 8: print students grouped by cohort
  # students_by_cohort = students.group_by { |student| student[:cohort]}.each{|cohort, student_hash| student_hash.map!{ |h| h[:name]}}
  # students_by_cohort.each { |cohort, name|
  #   puts cohort.to_s.upcase
  #   puts name
  # }
  
  # # ex. 5: print student number before name
  # students.each.with_index(1) { |student, index| 
  #   # if student{}
  #   puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort). Their hobby is #{student[:hobby]} and they were born in #{student[:birthplace]}"
  # }


# # exercise 4: print student using while loop
# def print_student(students)
#   counter = 0
#   while counter < students.count
#     puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
#     counter += 1
#   end
# end

# ex. 7: user inputs cohort
# def input_students
#   cohort_to_symbol_map = {"January" => :January, "February" => :February, "March" => :March,
#     "April" => :April, "May" => :May, "June" => :June, "July" => :July,
#     "August" => :August, "September" => :September, "October" => :October,
#     "November" => :November, "December" => :December}
  
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   loop do
#   # while the name is not empty, add a hash to the array
#     # get name
#     puts "Please enter the names of the student"
#     name = gets.chomp
#     break if name.empty?

#     puts "Please enter the student's cohort month"
#     while cohort = gets.chomp
#       if cohort == ""
#         # Default cohort if no cohort given
#         cohort = :February
#         break
#       elsif !cohort_to_symbol_map.has_key?(cohort) # returns true if user input is not in matching hash
#         puts "The cohort you have input is not a valid month - please re-enter the cohort" 
#       else
#         break
#       end
#     end
#     # add the student hash to the array
#     students << {name: name, cohort: cohort}
#     puts "Now we have #{students.count} students"
#   end
#   # return the array of students
#   students
# end

# # original student array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :November},
#   {name: "Darth Vader", cohort: :January},
#   {name: "Nurse Ratched", cohort: :January},
#   {name: "Michael Corleone", cohort: :March},
#   {name: "Alex DeLarge", cohort: :April},
#   {name: "The Wicked Witch of the West", cohort: :May},
#   {name: "Terminator", cohort: :May},
#   {name: "Freddy Krueger", cohort: :May},
#   {name: "The Joker", cohort: :October},
#   {name: "Joffrey Baratheon", cohort: :October},
#   {name: "Norman Bates", cohort: :October}
# ]

# # student array with hobby, country of birth
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november, hobby: "gastronomy", birthplace: "Wales"}, 
#   {name: "Darth Vader", cohort: :november, hobby: "fashion", birthplace: "Tatooine"}
# ]