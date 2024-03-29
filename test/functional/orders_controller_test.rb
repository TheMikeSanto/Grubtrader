require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user1)
    @organization = organizations(:two)
    @user.update_attribute(:organization_id, @organization.id)
    @organization.update_attributes(settings: {org_admin_ids: [@user.id]})
    sign_in @user
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @order.attributes
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order.to_param
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order.to_param, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end
end
