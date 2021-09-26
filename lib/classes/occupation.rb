class Occupation 
  def initialize(job_name, salary_range, growing, job_size, job_competitiveness, personality_suitability)
    @job_name = job_name
    @salary_range = salary_range
    @growing = growing
    @job_size = job_size
    @job_competitiveness = job_competitiveness
    @personality_suitability = personality_suitability
  end

  def generate_career_suggestion
  end


  # Compare two occupations on any of the instance attributes 

  protected

  def compare_occupations
  end

end

