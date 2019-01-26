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

  def add_money_to_till(drink)
    @till += drink.price
  end






end
