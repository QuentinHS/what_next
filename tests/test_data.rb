require 'test/unit'
require_relative '../classes/occupation'
require_relative '../modules/occupation_data'

class TestComparison < Test::Unit::TestCase

  # test loading of occupation json data
  def test_load_occupation_data
    OccupationData.load_occupation_data('../occupation_data.json')
  end

end