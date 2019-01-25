require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( "../room")
require_relative( "../song" )


class TestRoom < MiniTest::Test

  def setup()
    @song_1 = Song.new("Mamma Mia")
    @song_2 = Song.new("Like a Virgin")
    @song_3 = Song.new("Hey Jude")
    songs_available = [@song_1, @song_2, @song_3]
    @room = Room.new("Funk Town", 4, 5, songs_available)
  end

  def test_song_has_name()
    assert_equal("Funk Town", @room.name)
  end




end
