# Data from https://joboutlook.gov.au/occupations/

class Occupation 
  def initialize(job_name, salary_range, potential_growth, job_size, personality_suitability)
    @job_name = job_name
    @salary_range = salary_range
    @potential_growth = potential_growth
    @job_size = job_size
    @personality_suitability = personality_suitability
  end

  def generate_career_suggestion
  end

  # Compare two occupations on any of the instance attributes 

  protected

  def compare_occupations
  end

end


