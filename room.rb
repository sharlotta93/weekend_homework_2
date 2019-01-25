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

  def check_in_guest(guest)
    if guest.age >= 18
      @current_guests << guest
    else
      p "You're too young!"
    end
  end

  def check_out_guest(guest)
      @current_guests.delete(guest)
  end

end
