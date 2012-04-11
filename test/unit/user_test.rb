require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "should not save without role_id" do
		user = User.new(lname: "a", fname: "b", email: "b@b.com", organization_id: 1)
		assert !user.save
	end

	test "should not save without organization_id" do
		user = User.new(lname: "a", fname: "b", email: "b@b.com", role_id: 1)
		assert !user.save
	end
end
