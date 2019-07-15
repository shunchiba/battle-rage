require 'test_helper'

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get descriptions_show_url
    assert_response :success
  end

end
