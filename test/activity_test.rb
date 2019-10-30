require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/activity'

class TestActivity < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_activity_initialized
    assert_instance_of Activity, @activity
    assert_equal 'Brunch', @activity.name
  end

  def test_activity_participants
    assert_equal ({}), @activity.participants
    @activity.add_participant('Maria', 20)
    assert_equal ({'Maria' => 20}), @activity.participants
    @activity.add_participant('Luther', 40)
    assert_equal ({'Maria' => 20, 'Luther' => 40}), @activity.participants
    assert_equal 60, @activity.total_cost
  end

  def test_activity_split_and_owed
    @activity.add_participant('Maria', 20)
    @activity.add_participant('Luther', 40)
    assert_equal 30, @activity.split
    assert_equal ({"Maria" => 10, "Luther" => -10}), @activity.owed
  end

end
