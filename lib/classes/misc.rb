class User
  def initialize(name)
    @name = name
    @favorite_school_subject = favorite_school_subject
    @enjoy_formal_education = enjoy_formal_education
    @enjoyed_skilled_work = enjoyed_skilled_work
    @desired_salary_range = desired_salary_range
    @enjoy_working_with_people = enjoy_working_with_people 
    @kersey_type = nil
  
  end

end


class Occupation 
  def initialize(job_name, salary_min, salary_max, sector_size, growing, is_primarily_autonomous, is_primarily_outdoors, education_level_required,involves_social_responsibility, involves_helping_others, has_significant_variety, myer_briggs_suitability)
    @job_name = job_name
    @salary_min = salary_min
    @salary_max = salary_max
    @sector_size = sector_size
    @growing = growing
    @is_primarily_autonomous = is_primarily_autonomous
    @is_primarily_outdoors = is_primarily_outdoors
    @education_level_required = education_level_required 
    @involves_social_responsibility = involves_social_responsibility 
    @involves_helping_others = involves_helping_others 
    @has_significant_variety = has_significant_variety
    @is_creative = nil;
    @myer_briggs_suitability = myer_briggs_suitability   
    
    # Starting to get into way too many variables here. Might be best to break it down into multiple composite classes (or modules?) that calculate a given score on a given range. Future proof? Personality type? So put together several different scores and calculate an average from them. 
  end
end