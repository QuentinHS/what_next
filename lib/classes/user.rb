require 'json'
require 'colorize'
require_relative "./PersonalityProfile"
require_relative "./Temperament"
require_relative '../errors/invalid_input_error'

class User
  attr_reader :name, :personality_type, :temperament
  attr_accessor :personality_profile

  def initialize(name)
    @name = name
    @personality_profile = PersonalityProfile.new
    @personality_type = nil
    @temperament = nil
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

  def to_s
    puts "Hi, my name is #{self.name}, I am a #{self.personality_type} and I am a #{self.temperament}"
    
  end
end


