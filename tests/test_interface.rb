require 'test/unit'
require '../classes/UserInterface'

class InterfaceTest < Test::Unit::TestCase

  # test creation of new user interface
  def test_create_interface
    user_interface = UserInterface.new
  end

end