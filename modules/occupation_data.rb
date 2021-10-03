require 'json'
require_relative '../classes/occupation'

module OccupationData
  # Attempt to load job data from json occupations file and throw error if this is unsuccessful
  def self.load_occupation_data(occupation_data)
    begin
    data = JSON.load_file(occupation_data, symbolize_names: true)
    rescue LoadError => e
      puts e.message
      return
    end
    # create list to store occupation instances
    occupations = []

    # create list of occupation instances based on data
    data.each do |item|
      occupation = Occupation.new(item[:name], item[:aliases], item[:salary_min], item[:salary_average], item[:salary_high], item[:growing], item[:long_term_growth], item[:job_size], item[:vulnerable_to_automation], item[:personality_suitability])
    
      occupations << occupation
    end
    occupations
  end
  
end