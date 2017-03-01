require 'test_helper'

class March1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index2" do
    get march1_index2_url
    assert_response :success
  end

end
