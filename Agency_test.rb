require 'test/unit'
require_relative 'Agency.rb'

MEN = [
    Curler.new('Jason', 1, 5),
    Curler.new('John',6,4)
]
FEMALE = [
    Curler.new('Joan',5,1),
    Curler.new('Jane',4,2)
]

class AgencyTest < Test::Unit::TestCase

  def setup
    @test = Agency.new(MEN,FEMALE)
  end

  def test_teams
    @test.create_teams
    assert_equal('Jason',@test.men[0].name, 'Teams not sorted correctly')
    assert_equal('Jane',@test.women[0].name, 'women not sorted correctly')
  end

  def test_teams_to_s
    assert_equal("(Jane, Jason) Satisfaction: -1.0\n(Joan, John) Satisfaction: 0.0\n",@test.teams_to_s,'teams not displayed correctly')
  end

  def test_first_ascent
    @test.first_ascent
    assert_equal("(Joan, Jason) Satisfaction: 0.0\n(Jane, John) Satisfaction: 0.0\n",@test.teams_to_s,'teams not displayed correctly')
  end

  def test_load_men
    test_load = Agency.new
    assert_equal("file does not exist", test_load.load_men('invalid men'), 'File does not exist')
    assert_equal("file does not exist", test_load.load_women('invalid women'), 'File does not exist')
  end

  def test_each_curler
    i=0
    @test.each_curler do |this|
      i+=1
    end
    assert_equal(4,i,'invalid number of profiles')
  end
end