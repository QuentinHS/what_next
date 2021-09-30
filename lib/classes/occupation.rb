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


end






 