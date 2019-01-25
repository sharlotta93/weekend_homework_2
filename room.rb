class Room

  attr_reader :name, :capacity, :rate
  attr_accessor :songs_available

  def initialize(name, capacity, rate, songs_available)
    @name = name
    @capacity = capacity
    @rate = rate
    @songs_available = songs_available

  end 




end
