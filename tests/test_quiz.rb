require "test/unit"
require_relative '../classes/user'
require_relative '../classes/PersonalityProfile'

class QuizTest < Test::Unit::TestCase

  def test_user_input_validity
    user = User.new('user')
    user.personality_profile = PersonalityProfile.new
    # Check if user answers are valid - regex returns true if valid
    assert_equal(true, user.personality_profile.validate_answer("a"))
    assert_equal(true, user.personality_profile.validate_answer("b"))
    # # Ensure that invalid input will not return false
    refute_equal(true, user.personality_profile.validate_answer("invalid answer"))
 
  end

end