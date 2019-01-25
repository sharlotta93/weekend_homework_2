class Room

  attr_reader :name, :capacity, :rate
  attr_accessor :songs_available, :current_guests

  def initialize(name, capacity, current_guests, rate, songs_available)
    @name = name
    @capacity = capacity
    @current_guests = current_guests
    @rate = rate
    @songs_available = songs_available
  end

  def add_song(song)
    @songs_available << song
  end

  def get_room_price
    return @rate
  end

  def capacity_check
     @capacity > @current_guests.count
  end

  def check_in_guest(guest)
    if capacity_check()
      if guest.age >= 18
        @current_guests << guest
      else
        return "You're too young!"
      end
    end
    return "Room is full!"
  end

  def check_out_guest(guest)
      @current_guests.delete(guest)
  end

end
