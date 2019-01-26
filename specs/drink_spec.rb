require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")



class TestDrink < MiniTest::Test


  def setup
    @drink = Drink.new("Beer", 3)
  end

  def test_get_drink_name()
    assert_equal("Beer", @drink.name)
  end

end
