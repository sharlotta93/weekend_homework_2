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




end
