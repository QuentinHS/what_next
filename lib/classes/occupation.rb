class Occupation 

  attr_reader :job_name, :salary_min, :salary_average, :growing, :job_size, :personality_suitability

  def initialize(job_name, salary_min, salary_average, growing, job_size, personality_suitability)
    @job_name = job_name
    @salary_min = salary_min
    @salary_average = salary_average
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
  # def calculate_occupation_size
  #   self.job_size > 100000 ? "large" : self.job_size  > 50000 ? "medium" : "small" 
  # end

  # Compare two occupations based on instance attributes

  def compare_occupation(compared_occupation)
    puts "#{self.job_name} generally has a #{self.salary_min == compared_occupation.salary_min ? "similar" : self.salary_min > compared_occupation.salary_min ? "higher" : "lower "} minimum salary than #{compared_occupation.job_name}"
  end

end





# occupations.each do |item|
#   puts item.job_name
#   puts item.salary_min
#   puts item.salary_average
#   puts item.growing
#   puts item.job_size
#   puts item.personality_suitability
# end



 