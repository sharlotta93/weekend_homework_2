require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song' )


class TestSong < MiniTest::Test

  def setup()
    @song = Song.new("Mamma Mia")
  end

  def test_song_has_name()
    assert_equal("Mamma Mia", @song.name)
  end




end
