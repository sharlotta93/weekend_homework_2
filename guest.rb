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
    end
  end

  def favourite_song?(songs)
    fav_song_available = songs.find { |song| song == @favourite_song }
        if fav_song_available
          return "Whooohoo!"
        end
   end

   def pay_for_drink(drink)
      if @wallet > drink.price
         @wallet -= drink.price
      end
   end

   def buy_drink(bar, drink)
      if pay_for_drink(drink)
        bar.get_drink(drink)
     end
   end

end
