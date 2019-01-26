require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( "../room")
require_relative( "../song")



class TestRoom < MiniTest::Test

  def setup()
    @song_1 = Song.new("Mamma Mia")
    @song_2 = Song.new("Like a Virgin")
    @song_3 = Song.new("Ghost Assassin")
    @songs = [@song_1, @song_2]
    @room = Room.new("Funk Town", 4, [] , 5, @songs)
  end

  def test_song_has_name()
    assert_equal("Funk Town", @room.name)
  end

  def test_add_song_to_the_room
    @room.add_song(@song_3)
    assert_equal(3, @songs.count)
  end

  def test_room_price
    assert_equal(5, @room.get_room_price)
  end



end
