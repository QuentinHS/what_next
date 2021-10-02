
# Data from https://joboutlook.gov.au/occupations/
require "json"
require 'colorize'
require_relative '../classes/occupation'
require_relative '../errors/invalid_input_error'
require_relative './occupation_data'


module CompareOccupations
   def self.validate_comparison(occupations, answer)
    occupations.any? do |item| 
      item.job_name == answer || item.job_aliases.include?(answer) 
    end 
  end

  # Get user choices for occupation search
def self.get_occupation(occupation_data)

  occupations = OccupationData.load_occupation_data(occupation_data)

  # Get user input for first occupation comparison choice
  puts "Please enter the first occupation:"
  first_occupation = gets.chomp.strip.downcase
  # Return from function if user desires
  return if first_occupation == "-q"
  # Raise error if job cannot be found in job titles
  raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless CompareOccupations.validate_comparison(occupations, first_occupation)
  
    # Get user input for second occupation comparison choice
  puts "Please enter the second occupation:"
  second_occupation = gets.chomp.strip.downcase
  return if first_occupation == "-q"  
  # Raise error if job cannot be found in job titles
  raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless CompareOccupations.validate_comparison(occupations, second_occupation)
    # Raise error if user tries to compare the same job
  raise InvalidInputError, "Sorry, the two occupations cannot be the same, please try again or press -q to exit.".red if first_occupation == second_occupation

  # if job name is alias, convert to primary name
  occupations.any? do |item| 
    if item.job_aliases.include?(first_occupation)
      first_occupation = item.job_name
    end
    if item.job_aliases.include?(second_occupation)
      second_occupation = item.job_name
    end
  end
  # return user occupation input 
  return {occupation_list: occupations, 
    first_occupation: first_occupation, second_occupation: 
    second_occupation}
  end
 


end