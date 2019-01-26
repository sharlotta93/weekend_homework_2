require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( "../room")
require_relative( "../song")
require_relative( "../guest")


class TestRoom < MiniTest::Test

  def setup()
    @song_1 = Song.new("Mamma Mia")
    @song_2 = Song.new("Like a Virgin")
    @song_3 = Song.new("Hey Jude")
    @song_4 = Song.new("Ghost Assassin")
    @songs = [@song_1, @song_2, @song_3]
    @room = Room.new("Funk Town", 4, [] , 5, @songs)
    @guest_1 = Guest.new("Bob", 32, 40, @song_2)
    @guest_2 = Guest.new("Janet", 40, 20, @song_3)
    @guest_3 = Guest.new("Vix", 19, 30, @song_1)
  end

  def test_song_has_name()
    assert_equal("Funk Town", @room.name)
  end

  def test_add_song_to_the_room
    @room.add_song(@song_4)
    assert_equal(4, @songs.count)
  end

  def test_room_rate_slash_price
    assert_equal(5, @room.get_room_price)
  end

  def test_check_out_guests
    @room.check_in_guest(@guest_1, @room)
    @room.check_in_guest(@guest_2, @room)
    @room.check_out_guest(@guest_2)
    assert_equal(1, @room.current_guests.count)
  end

  def test_check_out_guests____multiple_guests
    @room.check_in_guest(@guest_1, @room)
    @room.check_in_guest(@guest_2, @room)
    @room.check_in_guest(@guest_3, @room)
    result = @room.check_out_guest(@guest_3)
    assert_equal(2, @room.current_guests.count)
    assert_equal(@guest_3, result)
  end

  def test_check_out_guests____guest_does_not_exists
    @room.check_in_guest(@guest_1, @room)
    @room.check_in_guest(@guest_2, @room)
    result = @room.check_out_guest(@guest_3)
    assert_equal(2, @room.current_guests.count)
    assert_nil(result)
  end



end
