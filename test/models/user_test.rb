require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@user1 = users(:one)
  	@user2 = users(:two)
  	@user3 = users(:three)
  end

  test "It is too young" do
  	assert_equal(["is too soon. You're too young."], @user3.too_young, 'It is too young' )
  end

  test "Future date" do
  	assert_equal(["is a future date"], @user2.future_date, 'Oops! Future date.')
  end
  test "OK. Older enough" do
  	assert_equal(nil, @user1.too_young, 'Older enough')
  	assert_equal(nil, @user1.future_date, 'Correct date')
  	assert_equal(nil, @user1.valid_date?, 'Correct birthdate')

  end

  test "It's admin" do
  	@variable = @user1.role_user
  	assert_equal('admin', @variable.name, 'Admin')
  end


  test "It's User" do
  	@variable = @user2.role_user
  	assert_equal('user', @variable.name, 'User')
  end

  test "Age" do
  	age=Time.diff(Time.now,@user1.birthdate)[:year]
  	assert_equal(age,@user1.age,'Correct age')
  end
  # test "the truth" do
  #   assert true
  # end
end
