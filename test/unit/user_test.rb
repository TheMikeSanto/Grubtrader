require 'test_helper'

class UserTest < ActiveSupport::TestCase

	setup do
		@user1 = users(:user1)
		@user2 = users(:user2)
		@admin = users(:admin1)

		@user1_ability = Ability.new(@user1)
		@user2_ability = Ability.new(@user2)
		@admin_ability = Ability.new(@admin)
	end

	test "should not save without role_id" do
		user = User.new(lname: "a", fname: "b", email: "b@b.com", organization_id: 1)
		assert !user.save
	end

	test "should not save without organization_id" do
		user = User.new(lname: "a", fname: "b", email: "b@b.com", role_id: 1)
		assert !user.save
	end

	test "should not be readable or editable by another non-admin user" do
		assert @user1_ability.cannot?(:read, @user2)
		assert @user1_ability.cannot?(:update, @user2)
	end

	test "should be readable and editable by the user itself" do
		assert @user1_ability.can?(:read, @user1)
		assert @user1_ability.can?(:update, @user1)
	end

	test "should be readable and editable by an admin" do
		assert @admin_ability.can?(:read, @user1)
		assert @admin_ability.can?(:read, @user2)
		assert @admin_ability.can?(:update, @user1)
		assert @admin_ability.can?(:update, @user2)
	end
end
