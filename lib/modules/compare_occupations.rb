
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
end