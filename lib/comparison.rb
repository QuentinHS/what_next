# Data from https://joboutlook.gov.au/occupations/
require "json"
require 'colorize'
require_relative './classes/occupation'
require_relative './errors/invalid_input_error'


# Create validation function to check if occupation exists in database using name property
def validate_comparison(occupations, answer)
  occupations.any? {|item| item.job_name == answer}
end

# Get user choices for occupation search
def get_occupation(occupation_data)
  # Load job data from json occupations file
  data = JSON.load_file(occupation_data, symbolize_names: true)  
  # create list to store occupation instances
  occupations = []

  # create list of occupation instances based on data
  data.each do |item|
    occupation = Occupation.new(item[:name], item[:salary_min], item[:salary_average], item[:salary_high], item[:growing], item[:long_term_growth], item[:job_size], item[:vulnerable_to_automation], item[:personality_suitability])
  
    occupations << occupation
  end

  # Get user input for first occupation comparison choice
  puts "Please enter the first occupation:"
  first_occupation = gets.chomp.strip.downcase
  # Return from function if user desires
  return if first_occupation == "-q"
  # Raise error if job cannot be found in job titles
  raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless validate_comparison(occupations, first_occupation)
  
    # Get user input for second occupation comparison choice
  puts "Please enter the second occupation:"
  second_occupation = gets.chomp.strip.downcase
  return if first_occupation == "-q"  
  # Raise error if job cannot be found in job titles
  raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless validate_comparison(occupations, second_occupation)
    # Raise error if user tries to compare the same job
  raise InvalidInputError, "Sorry, the two occupations cannot be the same, please try again or press -q to exit.".red if first_occupation == second_occupation

  return {occupation_list: occupations, 
    first_occupation: first_occupation, second_occupation: 
    second_occupation}
end
 
  # Retrieve index of occupation in occupation instance array list
  def find_occupation(occupations, occupation_name_input)
    occupations.find_index { |occupation| occupation.job_name == occupation_name_input }
  end

  # Use retrieved index to find occupations for comparison
  def compare_occupation_salary(occupation_data, occupation_one, occupation_two)
    # Use find occupation method to get index of occupation from user input
    index_one = find_occupation(occupation_data, occupation_one)
    index_two = find_occupation(occupation_data, occupation_two)
    # Retrieve jobs from instance array using found indexes
    occupation_one_instance = occupation_data[index_one]
    occupation_two_instance = occupation_data[index_two]

    # Display first comparison message to user for minimum slaries
    puts "#{occupation_one_instance.job_name.capitalize}s generally have a #{occupation_one_instance.salary_min == occupation_two_instance.salary_min ? "similar" : occupation_one_instance.salary_min > occupation_two_instance.salary_min ? "higher" : "lower"} minimum starting salary #{ occupation_one_instance.salary_min == occupation_two_instance.salary_min ? 'to': 'than'} #{occupation_two_instance.job_name}s.".blue
    # Display second message to use to compare average salaries
    puts "#{occupation_one_instance.job_name.capitalize}s also have a #{occupation_one_instance.salary_average == occupation_two_instance.salary_average ? "similar" : occupation_one_instance.salary_average > occupation_two_instance.salary_average ? "higher" : "lower"} average salary #{ occupation_one_instance.salary_average == occupation_two_instance.salary_average ? 'to': 'than'} #{occupation_two_instance.job_name}s.".magenta
    # Display final message showing potential high salary for occupations
    puts "On the high end, #{occupation_one_instance.job_name}s can make as much as $#{occupation_one_instance.salary_high} per year. #{occupation_two_instance.job_name.capitalize}s, on the other hand, can make as much as $#{occupation_two_instance.salary_high} per year.".cyan
  end

  # Use retrieved index to find occupations for comparison
  def compare_occupation_growth(occupation_data, occupation_one, occupation_two)
    # Use find occupation method to get index of occupation from user input
    index_one = find_occupation(occupation_data, occupation_one)
    index_two = find_occupation(occupation_data, occupation_two)
    # Retrieve jobs from instance array using found indexes
    occupation_one_instance = occupation_data[index_one]
    occupation_two_instance = occupation_data[index_two]

    # Display first comparison message to user for minimum slaries
    puts "#{occupation_one_instance.job_name.capitalize}s are currently experiencing #{!occupation_one_instance.growing ? 'negative' : occupation_one_instance.growing && occupation_one_instance.long_term_growth == "strong" ? 'strong' : 'low'} growth in their profession.".blue

    puts "#{occupation_one_instance.job_name.capitalize}s are currently experiencing #{!occupation_one_instance.growing ? 'negative' : occupation_one_instance.growing && occupation_one_instance.long_term_growth == "strong" ? 'strong' : 'low'} growth in their profession.".cyan

  end

