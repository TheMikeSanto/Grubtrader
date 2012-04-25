require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user         = users(:user1)
    @admin        = users(:admin1)
    @organization = organizations(:one)

    @user.update_attribute(:organization_id, @organization.id)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    @user.destroy  # Emails must be valid so we have to kill user2 before we resurrect him
    assert_difference('User.count') do
      post :create, user: @user.attributes.merge!({password: 'asdf1234', password_confirmation: 'asdf1234'})
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user.to_param, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end
end
