require "json"
require_relative "../classes/occupation"

module OccupationData

  def self.load_occupation_data(occupation_data)
    # Load job data from json occupations file
    data = JSON.load_file(occupation_data, symbolize_names: true)  
    # create list to store occupation instances
    occupations = []

    # create list of occupation instances based on data
    data.each do |item|
      occupation = Occupation.new(item[:name], item[:aliases], item[:salary_min], item[:salary_average], item[:salary_high], item[:growing], item[:long_term_growth], item[:job_size], item[:vulnerable_to_automation], item[:personality_suitability])
    
      occupations << occupation
    end
    occupations
  end
  
  def self.generate_random_color
    colors = [".blue", ".green", ".cyan", ".magenta", ".yellow"]
    color = colors.sample
    color
  end

end