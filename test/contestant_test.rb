require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'

class ContestantTest < MiniTest::Test 
  def setup 
    @alexander = Contestant.new({first_name: 'Alexander',
    last_name: 'Aigiades',
    age: 28,
    state_of_residence: 'CO',
    spending_money: 10})
    @mimi = Contestant.new({first_name: 'Mimi',
    last_name: 'Sugihara',
    age: 22,
    state_of_residence: 'MN',
    spending_money: 30})
  end

  def test_it_exists_and_has_readable_attributes
    assert_equal "Alexander Aigiades", @alexander.full_name
    assert_equal 28, @alexander.age
    assert_equal "CO", @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
  end

  def test_if_it_is_an_out_of_state_resident
    assert @alexander.out_of_state?
    refute @mimi.out_of_state?
  end
end