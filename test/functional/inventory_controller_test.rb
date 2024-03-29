require 'test_helper'

class InventoryControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user1)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
