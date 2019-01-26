class Room

  attr_reader :name, :capacity, :rate, :price
  attr_accessor :songs_available, :current_guests

  def initialize(name, capacity, current_guests, price, songs_available)
    @name = name
    @capacity = capacity
    @current_guests = current_guests
    @price = price
    @songs_available = songs_available
  end

  def add_song(song)
    @songs_available << song
  end

  def get_room_price
    return @price
  end

  def capacity_check
     @capacity > @current_guests.count
  end

end
