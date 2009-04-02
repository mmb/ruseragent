$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'ruseragent'
require 'test/unit'

class RuseragentTest < Test::Unit::TestCase

  def setup
    @r = Ruseragent::Ruseragent.new
  end

  def test_random_nil
    assert_not_nil(@r.random)
  end

  def test_random_one
    assert_not_nil(@r.random(:googlebot))
  end

  def test_random_many
    assert_not_nil(@r.random(:safari, :ie))
  end

  def test_identify
    assert_not_nil(
      @r.identify('Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'))
  end

end
