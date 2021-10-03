require 'test/unit'
require '../classes/user'
require '../classes/Temperament'
require '../classes/PersonalityProfile'

class UserTest < Test::Unit::TestCase
  # setup new user for testing
  def setup
    @user = User.new('user')  
  end

  # test creation of new user - should not be nil
  def test_create_user
    assert_not_nil = @user
  end

  # test creation of new user profile - should not be nil
  def test_create_user_personality_profile
    @user.personality_profile = PersonalityProfile.new
  end

  # test creation of user temperaments - should not create error
  def test_create_user_temperament
    @user.temperament = Temperament.new('Artisan','estp')
    @user.temperament = Temperament.new('Guardian','estj')
    @user.temperament = Temperament.new('Idealist','enfj')
    @user.temperament = Temperament.new('Rational','entj')
  end

  # test that user temperament function will output correct data - should output function data
  def test_user_display_output
    @user.temperament = Temperament.new('Artisan','estp')
    @user.temperament.give_personality_info
    @user.temperament = Temperament.new('Guardian','estj')
    @user.temperament.give_personality_info
    @user.temperament = Temperament.new('Idealist','enfj')
    @user.temperament.give_personality_info
    @user.temperament = Temperament.new('Rational','entj')
    @user.temperament.give_personality_info
  end

end