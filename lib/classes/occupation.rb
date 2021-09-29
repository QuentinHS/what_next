class Occupation 

  attr_reader :job_name, :salary_min, :salary_average, :salary_high, :growing, :long_term_growth, :vulnerable_to_automation, :job_size, :personality_suitability

  def initialize(job_name, salary_min, salary_average, salary_high, growing, long_term_growth, job_size, vulnerable_to_automation, personality_suitability)
    @job_name = job_name
    @salary_min = salary_min
    @salary_average = salary_average
    @salary_high = salary_high 
    @growing = growing
    @long_term_growth = long_term_growth
    @vulnerable_to_automation = vulnerable_to_automation
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

  def compare_occupation_salary(compared_occupation)
    puts "#{self.job_name} generally has a #{self.salary_min == compared_occupation.salary_min ? "similar" : self.salary_min > compared_occupation.salary_min ? "higher" : "lower "} minimum salary than #{compared_occupation.job_name}"
  end

end






 