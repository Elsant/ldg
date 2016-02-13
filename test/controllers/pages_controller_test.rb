require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should get root - index page" do
    get :index
    assert_response :success
    assert_not_empty response.body
    assert_match /LADIES\*DRESS\*GENTS/, response.body 
    assert_select 'p', "YOUR STYLIST AWAITS"
  end

end
