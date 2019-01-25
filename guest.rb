class Guest

attr_reader :name, :age, :wallet, :favourite_song

  def initialize(name, age, wallet, favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def pay_for_room(room)
     price = room.get_room_price()
     @wallet -= price
  end

  def sufficient_funds?(room)
    if  @wallet > room.get_room_price()
      pay_for_room(room)
    else
      return false
    end
  end

end
