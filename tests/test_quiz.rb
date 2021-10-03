require "test/unit"
require_relative '../classes/user'
require_relative '../classes/PersonalityProfile'

class QuizTest < Test::Unit::TestCase

  def test_user_input_validity
    user = User.new('user')
    user.personality_profile = PersonalityProfile.new
    # Check if user answers are valid - will return 0 if valid
    assert_equal(0, user.personality_profile.validate_answer("a"))
    assert_equal(0, user.personality_profile.validate_answer("b"))
    # Ensure that invalid input will not return 0 and be marked as valid
    refute_equal(0, user.personality_profile.validate_answer("invalid answer"))
    refute_equal(0, user.personality_profile.validate_answer(6453655))
  end

end