class Room

  attr_reader :name, :capacity, :rate
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

  # def old_enough?(guest)
  #   if guest.age >= 18
  #     return true
  #   end
  # end

  # def check_in_guest(guest, room)
  #   if capacity_check() && guest.sufficient_funds?(room) && old_enough?(guest)
  #       @current_guests << guest
  #   end
  #    return "Out!"
  # end

  # def check_out_guest(guest)
  #     @current_guests.delete(guest)
  # end

end
