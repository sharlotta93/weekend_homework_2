require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( "../guest")
require_relative( "../song" )
require_relative("../room")



class TestGuest < MiniTest::Test

  def setup()
    @song = Song.new("Mamma Mia")
    @guest = Guest.new("Bob", 32, 40, @song)
    @song_2 = Song.new("Like a Virgin")
    @song_3 = Song.new("Hey Jude")
    @songs = [@song, @song_2, @song_3]
    @room = Room.new("Funk Town", 4, [] , 5, @songs)
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

  def test_pay_for_the_room
    assert_equal(35, @guest.pay_for_room(@room))
  end

  def test_pay_for_the_room__no_sufficient_funds
    @guest_1 = Guest.new("Jackie", 18, 2, @song)
    assert_equal("I can't pay", @guest_1.sufficient_funds?(@room))
  end

  def test_pay_for_the_room__sufficient_funds
    @guest_1 = Guest.new("Jackie", 18, 20, @song)
    assert_equal(15, @guest_1.sufficient_funds?(@room))
  end

  def test_check_if_room_has_fvourite_song___true
    assert_equal("Whooohoo!", @guest.favourite_song?(@room.songs_available))
  end

  def test_check_if_room_has_fvourite_song___false
    @song_4 = Song.new("Ghost Assassin")
    @guest_1 = Guest.new("Jackie", 18, 20, @song_4)
    assert_nil( @guest_1.favourite_song?(@room.songs_available))
  end
end
