#User tests
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@user_uno = users(:one)
  	@user_dos = users(:two)
  	@user_tres = users(:three)
  end

  test "It is too young" do
  	assert_equal(["is too soon. You're too young."], @user_tres.too_young, 'It is too young' )
  end

  test "Future date" do
  	assert_equal(["is a future date"], @user_dos.future_date, 'Oops! Future date.')
  end
  test "OK. Older enough" do
  	assert_equal(nil, @user_uno.too_young, 'Older enough')
  	assert_equal(nil, @user_uno.future_date, 'Correct date')
  	assert_equal(nil, @user_uno.valid_date?, 'Correct birthdate')

  end

  test "It's admin" do
  	@variable = @user_uno.role_user
  	assert_equal('admin', @variable.name, 'Admin')
  end


  test "It's User" do
  	@variable = @user_dos.role_user
  	assert_equal('user', @variable.name, 'User')
  end

  test "Age" do
  	age=Time.diff(Time.now,@user_uno.birthdate)[:year]
  	assert_equal(age,@user_uno.age,'Correct age')
  end
  # test "the truth" do
  #   assert true
  # end
end
