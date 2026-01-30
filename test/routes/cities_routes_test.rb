require "test_helper"

class CitiesRoutesTest < ActionDispatch::IntegrationTest
  test "cities index route" do
    assert_routing "/cities",
      controller: "cities",
      action: "index"
  end

  test "cities show route" do
    assert_routing "/cities/1",
      controller: "cities",
      action: "show",
      id: "1"
  end
end
