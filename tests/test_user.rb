require 'test/unit'
require '../classes/user'
require '../classes/Temperament'
require '../classes/PersonalityProfile'

class UserTest < Test::Unit::TestCase
  # test creation of new user
  def test_create_user
    user = User.new(name)  
  end

  # test creation of new user profile
  def test_create_user_personality_profile
    user = User.new(name)  
    user.personality_profile = PersonalityProfile.new
  end

  # test creation of user temperaments
  def test_create_user_temperament
    user = User.new(name)  
    user.temperament = Temperament.new('Artisan','estp')
    user.temperament = Temperament.new('Guardian','estj')
    user.temperament = Temperament.new('Idealist','enfj')
    user.temperament = Temperament.new('Rational','entj')
  end

  # test that user temperament function will output correct data
  def test_user_display_output
    user = User.new(name)  
    user.temperament = Temperament.new('Artisan','estp')
    user.temperament.give_personality_info
    user.temperament = Temperament.new('Guardian','estj')
    user.temperament.give_personality_info
    user.temperament = Temperament.new('Idealist','enfj')
    user.temperament.give_personality_info
    user.temperament = Temperament.new('Rational','entj')
    user.temperament.give_personality_info
  end

end