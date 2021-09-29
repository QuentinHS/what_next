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
    occupation = Occupation.new(item[:name], item[:salary_min], item[:salary_average], item[:growing], item[:job_size], item[:personality_suitability])
  
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
 
begin
  jobs = get_occupation("./occupation_data.json")
rescue => e
  puts e.message
  retry
end

p jobs