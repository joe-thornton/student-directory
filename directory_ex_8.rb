# # original student array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

# # student array with hobby, country of birth
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november, hobby: "gastronomy", birthplace: "Wales"}, 
#   {name: "Darth Vader", cohort: :november, hobby: "fashion", birthplace: "Tatooine"}
# ]

# # Original input_students method
# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   # get name
#   name = gets.chomp
#   # while the name is not empty, add a hash to the array
#   while !name.empty? do
#     # add the student hash to the array
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     name = gets.chomp
#   end
#   # return the array of students
#   students
# end

# ex. 7: user inputs cohort
def input_students
  cohort_to_symbol_map = {"January" => :January, "February" => :February, "March" => :March,
    "April" => :April, "May" => :May, "June" => :June, "July" => :July,
    "August" => :August, "September" => :September, "October" => :October,
    "November" => :November, "December" => :December}
  
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  loop do
  # while the name is not empty, add a hash to the array
    # get name
    puts "Please enter the names of the student"
    name = gets.chomp
    break if name.empty?

    puts "Please enter the student's cohort month"
    while cohort = gets.chomp
      if cohort == ""
        # Default cohort if no cohort given
        cohort = :February
        break
      elsif !cohort_to_symbol_map.has_key?(cohort) # returns true if user input is not in matching hash
        puts "The cohort you have input is not a valid month - please re-enter the cohort" 
      else
        break
      end
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# # exercise 4: print student using while loop
# def print_student(students)
#   counter = 0
#   while counter < students.count
#     puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
#     counter += 1
#   end
# end

def print_student(students)

  # # ex. 3: names less than 12 characters
  # students.select { |student|
  #   puts student[:name] if student[:name].length < 12
  # }

  # # ex. 2: names starting with a specific character
  # student_first_letter = students.select { |student|
  #   puts student[:name] if student[:name].start_with?('T')
  # }

  # ex. 1: print student number before name
  students.each.with_index(1) { |student, index| 
    # if student{}
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  }

  # # ex. 5: print student number before name
  # students.each.with_index(1) { |student, index| 
  #   # if student{}
  #   puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort). Their hobby is #{student[:hobby]} and they were born in #{student[:birthplace]}"
  # }

end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_student(students)
# print_footer(students)