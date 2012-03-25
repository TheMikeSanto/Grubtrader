require 'test_helper'

class OrganizationRolesControllerTest < ActionController::TestCase
  setup do
    @organization_role = organization_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organization_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization_role" do
    assert_difference('OrganizationRole.count') do
      post :create, organization_role: @organization_role.attributes
    end

    assert_redirected_to organization_role_path(assigns(:organization_role))
  end

  test "should show organization_role" do
    get :show, id: @organization_role.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization_role.to_param
    assert_response :success
  end

  test "should update organization_role" do
    put :update, id: @organization_role.to_param, organization_role: @organization_role.attributes
    assert_redirected_to organization_role_path(assigns(:organization_role))
  end

  test "should destroy organization_role" do
    assert_difference('OrganizationRole.count', -1) do
      delete :destroy, id: @organization_role.to_param
    end

    assert_redirected_to organization_roles_path
  end
end
