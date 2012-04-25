require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase

	setup do
		@user1 = users(:user1)
		@user2 = users(:user2)
		@admin = users(:admin1)

		@user1_ability = Ability.new(@user1)
		@user2_ability = Ability.new(@user2)
		@guest_ability = Ability.new(User.new)
		@admin_ability = Ability.new(@admin)

		@organization = organizations(:one)
		@organization.update_attributes(settings: {org_admin_ids: [@user2.id]})
	end

	test "should be creatable and readable by anyone" do
		assert @guest_ability.can?(:read, @organization)
		assert @guest_ability.can?(:create, Organization)
	end

	test "should not be updateable by someone not in the organization" do
		assert @user1_ability.cannot?(:update, @organization)
	end

	test "should not be destroyable by non-admins" do
		assert @user1_ability.cannot?(:destroy, @organization)
		assert @user2_ability.cannot?(:destroy, @organization)
	end

	test "should be completely accessible to admins" do
		assert @admin_ability.can?(:update, @organization)
		assert @admin_ability.can?(:read, @organization)
	end
end
