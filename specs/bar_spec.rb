require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative("../bar")
require_relative( "../guest")
require_relative("../room")
require_relative("../drink")
require_relative("../song")



class TestBar < MiniTest::Test

  def setup()
    @drink_1 = Drink.new("Beer", 3)
    @drink_2 = Drink.new("Wine", 5)

    @song_1 = Song.new("Mamma Mia")
    @song_2 = Song.new("Like a Virgin")
    @song_3 = Song.new("Hey Jude")
    @songs = [@song_1, @song_2, @song_3]

    @room_1 = Room.new("Funk Town", 4, [] , 5, @songs)
    @bar = Bar.new("Dancing Tiger", @room_1, [@drink_1, @drink_2])
    @guest = Guest.new("Bob", 32, 40, @song_2)
    @guest_1 = Guest.new("Daniel", 18, 20, @song_3)
    @guest_2 = Guest.new("Janet", 26, 50, @song_1)
  end

  def test_get_bar_name()
    assert_equal("Dancing Tiger", @bar.bar_name)
  end

  def test_total_drinks()
    assert_equal(2, @bar.drinks.count)
  end

  def test_add_drink_to_pub()
    @drink_3 = Drink.new("Cider", 4)
    @bar.add_drink(@drink_3)
    assert_equal(3, @bar.drinks.count)
  end

  def test_get_drink_price()
    assert_equal(3, @drink_1.price)
  end

  def test_add_money_to_the_till
    @bar.add_money_to_till(@drink_2)
    assert_equal(5, @bar.till)
  end

  def test_if_guest_is_old_enough
    assert_equal(true, @bar.old_enough?(@guest))
  end

  def test_check_in_guests___too_young
    @guest_0 = Guest.new("Jodie", 16, 50, @song_1)
    assert_equal(false, @bar.check_in_guest(@guest_0, @room_1))
  end

  def test_get_drink_for_the_customer__add_money_to_till()
    assert_equal(@drink_1, @bar.get_drink(@drink_1)) #"Beer"))
    assert_equal(3, @bar.till)
  end

  def test_check_in_guest__check_room_capacity_not_enough_space
    @room_2 = Room.new("Metal Alchemist", 0, [] , 5, @songs)
    assert_equal(false, @bar.check_in_guest(@guest, @room_2))
  end

  def test_check_in_guest__check_room_capacity_enough_space
    @room = Room.new("Metal Alchemist", 4, [@guest] , 5, @songs)
    @bar.check_in_guest(@guest_1, @room)
    assert_equal(2, @room.current_guests.count)
  end

  def test_check_in_guest__check_room_capacity_not_enough_space_test_2
    @room_2 = Room.new("Metal Alchemist", 2, [@guest, @guest_1] , 5, @songs)
    assert_equal(false, @bar.check_in_guest(@guest_2, @room_2))
  end

  def test_check_in_guest__check_sufficient_funds
    @bar.check_in_guest(@guest_2, @room_1)
    assert_equal(1, @room_1.current_guests.count)
  end

  def test_check_out_guests
    @bar.check_in_guest(@guest, @room_1)
    @bar.check_in_guest(@guest_1, @room_1)
    @bar.check_out_guest(@guest_1, @room_1)
    assert_equal(1, @room_1.current_guests.count)
  end

  def test_check_out_guests____multiple_guests
    @bar.check_in_guest(@guest, @room_1)
    @bar.check_in_guest(@guest_1, @room_1)
    @bar.check_in_guest(@guest_2, @room_1)
    result = @bar.check_out_guest(@guest, @room_1)
    assert_equal(2, @room_1.current_guests.count)
    assert_equal(@guest, result)
  end

  def test_check_out_guests____guest_does_not_exists
    @bar.check_in_guest(@guest_1, @room_1)
    @bar.check_in_guest(@guest_2, @room_1)
    result = @bar.check_out_guest(@guest_3, @room_1)
    assert_equal(2, @room_1.current_guests.count)
    assert_nil(result)
  end

  def test_check_guest_in_and_they_buy_a_drink
    @bar.full_experience(@guest_1, @room_1, @drink_1)
    assert_equal(1, @room_1.current_guests.count)
    assert_equal(8, @bar.till)
  end

  def test_check_guest_in_and_they_buy_a_drink___not_enough_money
    @guest_3 = Guest.new("Brian", 21, 2, @song_1)
    @bar.full_experience(@guest_3, @room_1, @drink_2)
    assert_equal(0, @room_1.current_guests.count)
    assert_equal(0, @bar.till)
  end

end
