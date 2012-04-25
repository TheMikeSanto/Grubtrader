require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user1)
    @organization = organizations(:two)
    @user.update_attribute(:organization_id, @organization.id)
    @organization.update_attributes(settings: {org_admin_ids: [@user.id]})
    sign_in @user
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: @organization.attributes
    end

    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, id: @organization.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization.to_param
    assert_response :success
  end

  test "should update organization" do
    put :update, id: @organization.to_param, organization: @organization.attributes
    assert_redirected_to organization_path(assigns(:organization))
  end
end
