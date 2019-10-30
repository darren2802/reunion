require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/activity'
require_relative '../lib/reunion'

class TestReunion < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_reunion_initialized
    assert_instance_of Reunion, @reunion
    assert_equal '1406 BE', @reunion.name
  end

  def test_reunion_activities
    assert_equal [], @reunion.activities
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end

end
