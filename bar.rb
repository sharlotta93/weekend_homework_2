class Bar

attr_reader :bar_name, :drinks
attr_accessor :rooms, :till

  def initialize(bar_name, rooms, drinks)
    @bar_name = bar_name
    @rooms = rooms
    @drinks = drinks
    @till = 0
  end

  def add_drink(drink)
    @drinks << drink
  end

  def add_money_to_till(item) #item can be room or drink price
    @till += item.price
  end

  def get_drink(drink_requested)
    wanted_drink = @drinks.find { |drink| drink.name == drink_requested}
     if wanted_drink
       add_money_to_till(wanted_drink)
       return wanted_drink
     end
   end

   def old_enough?(guest)
     if guest.age >= 18
       return true
     end
   end

   def check_in_guest(guest, room)
     if room.capacity_check() && guest.sufficient_funds?(room) && old_enough?(guest)
         room.current_guests << guest
     end
      return "Out!"
   end

   def check_out_guest(guest, room)
     if guest.nil? == false
       room.current_guests.delete(guest)
     end
   end




end
