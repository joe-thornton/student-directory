@students = [] # creates an empty array accessible to all methods

# Step 9: Interactive menu
def interactive_menu
  loop do
    print_menu
    process_menu_choice(STDIN.gets.chomp)
  end
end

def process_menu_choice(menu_choice)
  case menu_choice
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
    puts "not a valid option, please try again"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # exit the method if filename has not been given in command line
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def load_students(filename = nil)
  if filename.nil?
    puts "Please enter the file you want to load from"
    filename = STDIN.gets.chomp
  end
  if File.exists?(filename)
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
      end 
    end
    puts "#{@students.count} students were loaded"
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

def save_students
  puts "Please enter the file you want to save to"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    # open the file for writing
    File.open(filename, "w") do |file|
      # iterate over the array of students
      @students.each do |student|
        # put student info in an array then join with commas
        csv_line = [student[:name], student[:cohort]].join(",")
        file.puts csv_line
      end
      puts "#{@students.count} students were saved"
    end
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

# step 10
def print_menu
  puts "Please select the option you want from below by entering the number"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load a list"
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
  name = STDIN.gets.chomp
  # while the name is not empty, add a hash to the array
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
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

try_load_students
interactive_menu