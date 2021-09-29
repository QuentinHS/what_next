require_relative "../personality_test"

class User
  attr_reader :name, :personality_type

  def initialize(name)
    @name = name
    @personality_profile = PersonalityProfile.new
    @personality_type = nil
  end

  # Use PersonalityProfile class to generate personality type for the user

  def generate_personality_type(personality_profile)
    personality_type = ""
    values = personality_profile.values

    personality_type += values[0] >= 5 ? "e" : "i"
    personality_type += values[2] >= 10 ? "s" : "n"
    personality_type += values[4] >= 10 ? "t" : "f"
    personality_type += values[6] >= 10 ? "j" : "p"

    @personality_type = personality_type
  end

  def to_s
    puts "Hi, my name is #{self.name}"
  end
end

user = User.new('tom')


