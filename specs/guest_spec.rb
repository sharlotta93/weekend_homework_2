require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( "../guest")
require_relative( "../song" )



class TestGuest < MiniTest::Test

  def setup()
    @song = Song.new("Mamma Mia")
    @guest = Guest.new("Bob", 32, 40, @song)
  end

  def test_customer_has_name()
    assert_equal("Bob", @guest.name)
  end

  def test_customer_has_age()
    assert_equal(32, @guest.age)
  end

  def test_customer_has_favourite_song()
    assert_equal("Mamma Mia", @guest.favourite_song.title)
  end




end
