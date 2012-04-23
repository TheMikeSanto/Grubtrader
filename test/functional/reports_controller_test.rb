require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user1)
    @organization = organizations(:one)
    @user.update_attribute(:organization_id, @organization.id)
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
