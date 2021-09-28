# Data from https://joboutlook.gov.au/occupations/
require "json"

data = JSON.load_file('../occupation_data.json', symbolize_names: true)  
occupations = []


class Occupation 

  attr_reader :job_name, :salary_range

  def initialize(job_name, salary_min, salary_max, growing, job_size, personality_suitability)
    @job_name = job_name
    @salary_min = salary_min
    @salary_max = salary_max
    @growing = growing
    @job_size = job_size
    @personality_suitability = personality_suitability
  end

  # Calculate ranking of careers  
  def calculate_career_ranking
  end

  def generate_career_suggestion
  end
  
  # Calculates the size of a profession
  def calculate_occupation_size
    self.job_size > 100000 ? "large" : self.job_size  > 50000 ? "medium" : "small" 
  end

  # Compare two occupations based on instance attributes

  # def compare_occupation(compared_occupation)
  #   puts "#{self.job_name} has a #{self.salary_range == compared_occupation.salary_range ? "similar" : } salary range than #{compared_occupation.job_name}"
  # end

end


data.each do |item|
  occupation = Occupation.new(item[:name], item[:salary_min], item[:growing], item[:job_size], item[:personality_suitability])
 
  occupations << occupation

end

# occupations.each do |item|
#   puts item.job_name
# end

# occupations[0].compare_occupation(occupations[3])

 