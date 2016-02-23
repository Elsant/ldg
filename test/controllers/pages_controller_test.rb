require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  # test "Unsigned User visit Index page should get index page" do
  #   get :index
  #   assert_response :success
  #   assert_not_empty response.body
  #   assert_match /LADIES\*DRESS\*GENTS/, response.body 
  #   assert_select 'p', "YOUR STYLIST AWAITS"
  # end

  # test "Signed User visit Index page should get home page" do
  #   sign_in users(:one)
  #   get :index
  #   assert_response :redirect
  #   assert_not_empty response.body
  # end

  # test "Unsigned User visit Home page shouldn't get home page" do
  #   get :home
  #   assert_response :redirect
  #   assert_not_empty response.body
  # end

  # test "Signed User visit Home page should get home page" do
  #   sign_in users(:one)
  #   get :home
  #   assert_response :redirect
  #   assert_not_empty response.body
  # end

end
