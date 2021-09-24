class User
  def initialize(name, favorite_school_subject, enjoy_formal_education, enjoyed_skilled_work, desired_salary_range, enjoy_working_with_people )
    @name = name
    @favorite_school_subject = favorite_school_subject
    @enjoy_formal_education = enjoy_formal_education
    @enjoyed_skilled_work = enjoyed_skilled_work
    @desired_salary_range = desired_salary_range
    @enjoy_working_with_people = enjoy_working_with_people 
  
    @myer_briggs_type = nil
    # best approach might be to set to default value instead of initialised value, then set attribute one by one to the instance. For example:
    @is_idealistic = nil
    @is_creative = nil;
    # So cut down number of instance variables. But maybe give more weight to certain variables in that case? So give several 'points' to attribute to something they consider very important. 
  end
end