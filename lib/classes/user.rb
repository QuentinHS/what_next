require 'json'
require 'colorize'
require_relative "./PersonalityProfile"
require_relative "./Temperament"
require_relative '../errors/invalid_input_error'
require_relative '../modules/occupation_data'


class User
  attr_reader :name, :temperament
  attr_accessor :personality_profile, :occupations, :personality_type
  
  include OccupationData

  def initialize(name)
    @name = name
    @personality_profile = PersonalityProfile.new
    @personality_type = nil
    @temperament = nil
    @occupations = []
  end

  # Use PersonalityProfile class to generate personality type for the user

  def generate_personality_type
    # reset personality_type value to avoid duplication
    personality_type = ""
    # Take personality values from personality_profile class instances
    values = @personality_profile.profile_map.values

    # use values to assign alphanumeric personality type 
    personality_type += values[0] >= 5 ? "e" : "i"
    personality_type += values[2] >= 10 ? "s" : "n"
    personality_type += values[4] >= 10 ? "t" : "f"
    personality_type += values[6] >= 10 ? "j" : "p"

    # update instance variable with resulting personality type
    @personality_type = personality_type
  end

  def generate_personality_temperament
    if @personality_type = 'estp' || 'istp' || 'esfp' || 'isfp'
      @temperament = Temperament.new('Artisan', @personality_type)
    elsif @personality_type = 'estj' || 'istj' || 'esfj' || 'isfj'
      @temperament = Temperament.new('Guardian', @personality_type) 
    elsif @personality_type = 'enfj' || 'infj' || 'enfp' || 'infp'
        @temperament = Temperament.new('Idealist', @personality_type) 
    else   
      @temperament = Temperament.new('Rational', @personality_type) 
    end     
  end

  def generate_occupation_suggestion(occupation_data)
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


