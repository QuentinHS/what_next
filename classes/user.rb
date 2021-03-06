require 'json'
require 'colorize'
require_relative './PersonalityProfile'
require_relative './Temperament'
require_relative '../errors/invalid_input_error'
require_relative '../modules/occupation_data'


class User
  attr_reader :name 
  attr_accessor :personality_profile, :occupations, :personality_type, :temperament
  # load json occupation data
  include OccupationData

  # initialize new user
  def initialize(name)
    @name = name
    @personality_profile = PersonalityProfile.new
    @personality_type = nil
    @temperament = nil
    @occupations = []
  end

  # Use PersonalityProfile class to generate personality type for the user

  def generate_personality_type
    return nil if self.personality_profile.quiz_answers.empty?
    # reset personality_type value to avoid duplication
    personality_type = ""
    # Take personality values from personality_profile instance
    values = @personality_profile.profile_map.values

    # use values to assign personality type 
    personality_type += values[0] >= 5 ? "e" : "i"
    personality_type += values[2] >= 10 ? "s" : "n"
    personality_type += values[4] >= 10 ? "t" : "f"
    personality_type += values[6] >= 10 ? "j" : "p"

    # update instance variable with resulting personality type
    @personality_type = personality_type
  end

  # Assign a temperament (artisan, guardian, idealist or rational) to the user based on the scores on their quiz results and personality profile
  def generate_personality_temperament
    return nil if self.personality_profile.quiz_answers.empty?

    case @personality_type
    when 'estp'
      @temperament = Temperament.new('Artisan', @personality_type)
    when 'istp'
      @temperament = Temperament.new('Artisan', @personality_type)
    when 'esfp'
       @temperament = Temperament.new('Artisan', @personality_type)
    when 'isfp'
      @temperament = Temperament.new('Artisan', @personality_type)
    when  'estj'
       @temperament = Temperament.new('Guardian', @personality_type)
    when 'istj'
       @temperament = Temperament.new('Guardian', @personality_type)
    when 'esfp' 
       @temperament = Temperament.new('Guardian', @personality_type)
    when 'isfj'
       @temperament = Temperament.new('Guardian', @personality_type) 
    when 'enfj'
      @temperament = Temperament.new('Idealist', @personality_type)
    when 'infj'
      @temperament = Temperament.new('Idealist', @personality_type)
    when 'enfp'
      @temperament = Temperament.new('Idealist', @personality_type)
    when 'infp'
      @temperament = Temperament.new('Idealist', @personality_type)
    when 'entj'
      @temperament = Temperament.new('Rational', @personality_type) 
    when 'intj'
      @temperament = Temperament.new('Rational', @personality_type) 
    when 'entp'
      @temperament = Temperament.new('Rational', @personality_type) 
    when 'intp'
      @temperament = Temperament.new('Rational', @personality_type) 
    end     
  end

  # Based on the temperament assigned above, loop through occupation data to check if temperament matches any jobs, along with additional criteria to see if job is sufficiently large, not vulnerable to automate etc
  def generate_occupation_suggestion(occupation_data)
    return nil if self.personality_profile.quiz_answers.empty?

      @occupations = OccupationData.load_occupation_data(occupation_data)
      puts "Based on your #{self.personality_type.upcase} personality type, you may be particularly compatible with the following occupations:".green
      found_occupation = false
      @occupations.each do |occupation|
        if occupation.personality_suitability.join(" ").downcase.include?(self.personality_type) && occupation.job_size > 15000 && occupation.growing && !occupation.vulnerable_to_automation
          puts "#{occupation.job_name.capitalize}".cyan
          found_occupation = true
        end
      end
      if !found_occupation 
        puts "Sorry, there were no matches for your personality type :( We'll try to add more occupations to our list in the future, I'm sure we can find something for you!".red
      end
  end
end


