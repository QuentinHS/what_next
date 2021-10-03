module Search
  # retrieve jobs that include selected personality type
  def self.retrieve_jobs_by_personality(temperament, occupations)
    suitable_job_list = []
      occupations.each do |occupation|
        suitable_job_list.push(occupation.job_name) if occupation.personality_suitability.include?(temperament)
      end
    suitable_job_list
  end

  # display list of appropriate jobs to the user
  def self.display_suitable_jobs(temperament, suitable_job_list)
    puts "Some of the jobs that would potentially suit someone with an #{temperament} personality are: ".magenta
    suitable_job_list.each do |job|
      puts job.cyan
    end
  end

end