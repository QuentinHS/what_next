# Data from https://joboutlook.gov.au/occupations/
require "json"
require 'colorize'
require_relative './classes/occupation'
require_relative './errors/invalid_input_error'

module CompareOccupations
    
  # Create validation function to check if occupation exists in database using name property
  def validate_comparison(occupations, answer)
    occupations.any? {|item| item.job_name == answer}
  end

  # Create list of occupation instances from occupation class that can be used for different features
  def load_occupation_data(occupation_data)
      # Load job data from json occupations file
    data = JSON.load_file(occupation_data, symbolize_names: true)  
    # create list to store occupation instances
    occupations = []

    # create list of occupation instances based on data
    data.each do |item|
      occupation = Occupation.new(item[:name], item[:job_aliases], item[:salary_min], item[:salary_average], item[:salary_high], item[:growing], item[:long_term_growth], item[:job_size], item[:vulnerable_to_automation], item[:personality_suitability])
    
      occupations << occupation
    end
    occupations
  end

  # Get user choices for occupation search
  def get_occupation(occupation_data)

    occupations = load_occupation_data(occupation_data)

    # Get user input for first occupation comparison choice
    puts "Please enter the first occupation:"
    first_occupation = gets.chomp.strip.downcase
    # Return from function if user desires
    return if first_occupation == "-q"
    # Raise error if job cannot be found in job titles
    raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless validate_comparison(occupations, first_occupation)
    
      # Get user input for second occupation comparison choice
    puts "Please enter the second occupation:"
    second_occupation = gets.chomp.strip.downcase
    return if first_occupation == "-q"  
    # Raise error if job cannot be found in job titles
    raise InvalidInputError, "Sorry, no such occupation was found, please try again or press -q to exit.".red unless validate_comparison(occupations, second_occupation)
      # Raise error if user tries to compare the same job
    raise InvalidInputError, "Sorry, the two occupations cannot be the same, please try again or press -q to exit.".red if first_occupation == second_occupation

    return {occupation_list: occupations, 
      first_occupation: first_occupation, second_occupation: 
      second_occupation}
  end
  
    # Retrieve index of occupation in occupation instance array list
    def find_occupation(occupations, occupation_name_input)
      occupations.find_index { |occupation| occupation.job_name == occupation_name_input }
    end

    def retrieve_data(occupation_data, occupation_one, occupation_two)
      index_one = find_occupation(occupation_data, occupation_one)
      index_two = find_occupation(occupation_data, occupation_two)
      # Retrieve jobs from instance array using found indexes
      occupation_one_instance = occupation_data[index_one]
      occupation_two_instance = occupation_data[index_two]
      return {
        index_one: index_one,
        index_two: index_two,
        occupation_one_instance: occupation_one_instance,
        occupation_two_instance: occupation_two_instance
      }
    end 

    # Use retrieved index to find occupations for comparison
    def compare_occupation_salary(jobs)
      # Use data retrieval function to get necessary data for comparison
      data = retrieve_data(jobs[:occupation_list], jobs[:first_occupation], jobs[:second_occupation])
      # Destructure data from data hash map
      index_one, index_two, occupation_one_instance, occupation_two_instance = data.values_at(:index_one, :index_two, :occupation_one_instance, :occupation_two_instance)

      # Display first comparison message to user for minimum slaries
      puts "#{occupation_one_instance.job_name.capitalize}s generally have a #{occupation_one_instance.salary_min == occupation_two_instance.salary_min ? "similar" : occupation_one_instance.salary_min > occupation_two_instance.salary_min ? "higher" : "lower"} minimum starting salary #{ occupation_one_instance.salary_min == occupation_two_instance.salary_min ? 'to': 'than'} #{occupation_two_instance.job_name}s.".blue
      # Display second message to use to compare average salaries
      puts "#{occupation_one_instance.job_name.capitalize}s also have a #{occupation_one_instance.salary_average == occupation_two_instance.salary_average ? "similar" : occupation_one_instance.salary_average > occupation_two_instance.salary_average ? "higher" : "lower"} average salary #{ occupation_one_instance.salary_average == occupation_two_instance.salary_average ? 'to': 'than'} #{occupation_two_instance.job_name}s.".magenta
      # Display final message showing potential high salary for occupations
      puts "On the high end, #{occupation_one_instance.job_name}s can make as much as $#{occupation_one_instance.salary_high} per year. #{occupation_two_instance.job_name.capitalize}s, on the other hand, can make as much as $#{occupation_two_instance.salary_high} per year.".cyan
    end

    # Use retrieved index to find occupations for comparison
    def compare_occupation_growth(jobs)
      # Use data retrieval function to get necessary data for comparison
      data = retrieve_data(jobs[:occupation_list], jobs[:first_occupation], jobs[:second_occupation])
      # Destructure data from data hash map
      index_one, index_two, occupation_one_instance, occupation_two_instance = data.values_at(:index_one, :index_two, :occupation_one_instance, :occupation_two_instance)


      # Display first comparison message to user for minimum slaries
      puts "#{occupation_one_instance.job_name.capitalize}s are currently experiencing #{!occupation_one_instance.growing ? 'negative' : occupation_one_instance.growing && occupation_one_instance.long_term_growth == "strong" ? 'strong' : 'low'} growth in their profession, which will likely continue for the foreseeable future.".blue

      puts "By comparison, #{occupation_two_instance.job_name}s are #{occupation_one_instance.long_term_growth == occupation_two_instance.long_term_growth ? 'also ' : ''}experiencing #{!occupation_two_instance.growing ? 'negative' : occupation_two_instance.growing && occupation_two_instance.long_term_growth == "strong" ? 'strong' : 'low'} future growth for their profession.".cyan

    end

    # create function to compare occupations by number of members
  def compare_occupation_job_size(jobs)
        # Use data retrieval function to get necessary data for comparison
      data = retrieve_data(jobs[:occupation_list], jobs[:first_occupation], jobs[:second_occupation])
      # Destructure data from data hash map
      index_one, index_two, occupation_one_instance, occupation_two_instance = data.values_at(:index_one, :index_two, :occupation_one_instance, :occupation_two_instance)

      occupation_one_size = occupation_one_instance.job_size > 100000 ? 'very large' :
      occupation_one_instance.job_size > 50000 ? 'large' : occupation_one_instance.job_size > 20000 ? 'medium' :  occupation_one_instance.job_size > 5000 ? 'small' : 'very small'

      occupation_two_size = occupation_two_instance.job_size > 100000 ? 'very large' :
      occupation_two_instance.job_size > 50000 ? 'large' : occupation_two_instance.job_size > 20000 ? 'medium' : occupation_two_instance.job_size > 5000 ? 'small' : 'very small'

      # Display first comparison message to user for minimum salaries
      puts "#{occupation_one_instance.job_name.capitalize}s are part of a #{occupation_one_instance.job_size == occupation_two_instance.job_size ? 'similarly-sized' : occupation_one_instance.job_size > occupation_two_instance.job_size ? 'larger' : 'smaller'} profession than #{occupation_two_instance.job_name}s.".blue
      
      puts "As a whole, #{occupation_one_instance.job_name}s are members of a #{occupation_one_size} profession, while #{occupation_two_instance.job_name}s are part of a #{occupation_two_size} profession.".cyan
      
    
  end

  # Create function to compare jobs by their vulnerability to automation
  def compare_occupation_automation_vulnerability(jobs)
        # Use data retrieval function to get necessary data for comparison
      data = retrieve_data(jobs[:occupation_list], jobs[:first_occupation], jobs[:second_occupation])
      # Destructure data from data hash map
      index_one, index_two, occupation_one_instance, occupation_two_instance = data.values_at(:index_one, :index_two, :occupation_one_instance, :occupation_two_instance)

      puts "#{occupation_one_instance.job_name.capitalize}s are presently #{!occupation_one_instance.vulnerable_to_automation ? 'not ' : ''}considered to be vulnerable to increasing automation over the next decade.".blue 
      puts "Government data suggests that #{occupation_two_instance.job_name}s, by comparison, are #{!occupation_two_instance.vulnerable_to_automation ? 'not ' : ''}vulnerable to their profession being increasingly automated in the foreseeable future. ".cyan 

  end
end