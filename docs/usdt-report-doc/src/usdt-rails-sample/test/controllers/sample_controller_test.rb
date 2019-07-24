require 'test_helper'

class SampleControllerTest < ActionDispatch::IntegrationTest
  test "should get all,welcome" do
    get sample_all,welcome_url
    assert_response :success
  end

end
