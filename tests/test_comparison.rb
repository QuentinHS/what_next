require 'test/unit'
require_relative '../classes/occupation'
require_relative '../errors/invalid_input_error'
require_relative '../errors/quit_error'
require_relative '../modules/compare_occupations'

class TestComparison < Test::Unit::TestCase
# create test to check user input for occupation comparison
  def test_occupation_comparison_input
    data = OccupationData.load_occupation_data('../occupation_data.json')
    # test occupation input by primary name
    assert_equal(true, CompareOccupations.validate_comparison(data, "accountant"))
    assert_equal(true, CompareOccupations.validate_comparison(data, "teacher"))
    assert_equal(true, CompareOccupations.validate_comparison(data, "nurse"))
    # test occupation input by alias
    assert_equal(true, CompareOccupations.validate_comparison(data, "banker"))
    assert_equal(true, CompareOccupations.validate_comparison(data, "physio"))
    # ensure invalid occupations aren't compared
    refute_equal(true, CompareOccupations.validate_comparison(data, "not_a_profession"))
    refute_equal(true, CompareOccupations.validate_comparison(data, "453543543"))
  end

end