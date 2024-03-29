require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user2)
    sign_in @user
    @donation = donations(:one)
    @donation_line = donation_lines(:one)
    @donation_line.update_attributes(donation_id: @donation.id)
  end

  test "donation should have a donation_line" do
    assert (not @donation.donation_lines.empty?)
  end 

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation" do
    assert_difference('Donation.count') do
      post :create, donation: @donation.attributes
    end

    assert_redirected_to donation_path(assigns(:donation))
  end

  test "should show donation" do
    get :show, id: @donation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation.to_param
    assert_response :success
  end

  test "should update donation" do
    put :update, id: @donation.to_param, donation: @donation.attributes
    assert_redirected_to donation_path(assigns(:donation))
  end
end
