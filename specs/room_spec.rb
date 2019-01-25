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
    @room = Room.new("Funk Town", 4, 5, @songs)
  end

  def test_song_has_name()
    assert_equal("Funk Town", @room.name)
  end

  def test_add_song_to_the_room
    @room.add_song(@song_4)
    assert_equal(4, @songs.count)
  end

end
