require 'test/unit'
require_relative 'Curler.rb'


class CurlerTest < Test::Unit::TestCase

  def setup
    @curler1 = Curler.new('Jason', 5, 10)
  end



  def test_to_s
    assert_equal("Jason's proficiency is 5. Seeks partner with a proficiency >= 10", @curler1.to_s, 'incorrectly setup')
  end

  def test_out_of_range
    assert_raise ArgumentError do
      Curler.new('John', 0,10)
      puts 'valid'
    end

    assert_raise ArgumentError do
      Curler.new('John', 10,11)
      puts 'valid'
    end
  end

end