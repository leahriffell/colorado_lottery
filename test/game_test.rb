require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < MiniTest::Test 
  def setup 
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  def test_it_exists_and_has_readable_attributes
    assert_equal "Mega Millions", @mega_millions.name
    assert_equal 5, @mega_millions.cost
  end

  def test_if_it_is_a_national_drawing
    assert @mega_millions.national_drawing?
    refute @pick_4.national_drawing?
  end
end