require 'test_helper'

class DonationLinesControllerTest < ActionController::TestCase
  setup do
    @donation_line = donation_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_line" do
    assert_difference('DonationLine.count') do
      post :create, donation_line: @donation_line.attributes
    end

    assert_redirected_to donation_line_path(assigns(:donation_line))
  end

  test "should show donation_line" do
    get :show, id: @donation_line.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_line.to_param
    assert_response :success
  end

  test "should update donation_line" do
    put :update, id: @donation_line.to_param, donation_line: @donation_line.attributes
    assert_redirected_to donation_line_path(assigns(:donation_line))
  end

  test "should destroy donation_line" do
    assert_difference('DonationLine.count', -1) do
      delete :destroy, id: @donation_line.to_param
    end

    assert_redirected_to donation_lines_path
  end
end
