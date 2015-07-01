#Band tests
require 'test_helper'
#Test cases
class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@band_uno_test = bands(:one)
  	@band_dos_test= bands(:two)
  end

  test "non-alphanumeric characters presence" do
  	assert_equal(nil, @band_uno_test.valid_code_number?, 'Invalid code number' )
  end


  test "valid code numer" do
  	assert_equal(nil, @band_dos_test.valid_code_number?, 'Valid code number' )
  end

  test 'user age' do
    age=Time.diff(Time.now,User.find(@band_dos_test.user_id).birthdate)[:year]
    assert_equal(age,@band_dos_test.years_calculate,'Correct age')
  end

  test 'heart rate' do
    @user_uno = users(:one)
    assert_equal(135,@band_dos_test.heart_rate,'Correct heart rate')
    @user_uno.birthdate= Time.parse('1992-12-16 00:00:00')
    @user_uno.save
    assert_equal(129,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1982-12-16 00:00:00')
    @user_uno.save
    assert_equal(125,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1977-12-16 00:00:00')
    @user_uno.save
    assert_equal(122,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1972-12-16 00:00:00')
    @user_uno.save
    assert_equal(119,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1967-12-16 00:00:00')
    @user_uno.save
    assert_equal(115,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1962-12-16 00:00:00')
    @user_uno.save
    assert_equal(112,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1957-12-16 00:00:00')
    @user_uno.save
    assert_equal(108,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1952-12-16 00:00:00')
    @user_uno.save
    assert_equal(105,@band_dos_test.heart_rate,'Correct heart rate')
     @user_uno.birthdate= Time.parse('1940-12-16 00:00:00')
    @user_uno.save
    assert_equal(102,@band_dos_test.heart_rate,'Correct heart rate')
  end

  test 'steps goal' do
    @user_uno = users(:one)
    assert_equal(10000,@band_dos_test.steps_all,'Correct steps goal')
    @user_uno.birthdate= Time.parse('2005-12-16 00:00:00')
    @user_uno.save
    assert_equal(15000,@band_dos_test.steps_all,'Correct steps goal')
    @user_uno.birthdate= Time.parse('1960-12-16 00:00:00')
    @user_uno.save
    assert_equal(2000,@band_dos_test.steps_all,'Correct steps goal')
  end

  test 'Sleeping goal' do
     @user_uno = users(:one)
    assert_equal(8,@band_dos_test.sleep_all,'Correct sleep goal')
    @user_uno.birthdate= Time.parse('2005-12-16 00:00:00')
    @user_uno.save
    assert_equal(10,@band_dos_test.sleep_all,'Correct sleep goal')
    @user_uno.birthdate= Time.parse('1960-12-16 00:00:00')
    @user_uno.save
    assert_equal(7,@band_dos_test.sleep_all,'Correct sleep goal')
  end

  test 'Weight goal' do
    assert_equal('65.0',@band_dos_test.weight_all.to_s,'Correct Weight goal')

  end

  test 'Calories goal' do
    assert_equal('3333.875',@band_dos_test.calories_male.to_s,'Correct Calories goal for a guy')
    assert_equal('3059.975',@band_dos_test.calories_female.to_s,'Correct Calories goal for a girl')
    @user_uno = users(:one)
    @user_uno.weight = 65
    @user_uno.save
    assert_equal('2668.875',@band_dos_test.calories_male.to_s,'Correct Calories goal for a guy with perfect weight')
    assert_equal('2394.975',@band_dos_test.calories_female.to_s,'Correct Calories goal for a girl with perfect weight')
  end

  test 'Get goals' do
    assert_equal(1,@band_dos_test.goals_automatics[1][:user_id],'Goals belong to the correct user (male)')
    @user_uno = users(:one)
    @user_uno.sex = 'Female'
    @user_uno.save
    assert_equal(1,@band_dos_test.goals_automatics[1][:user_id],'Goals belong to the correct user (female)')
  end

  test 'Sleep quailit' do
    @user_uno = users(:one)
    assert_equal(70,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
    @user_uno.birthdate= Time.parse('2005-12-16 00:00:00')
    @user_uno.save
    assert_equal(80,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
    @user_uno.birthdate= Time.parse('1960-12-16 00:00:00')
    @user_uno.save
    assert_equal(75,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
    @user_uno.sex = 'Female'
    @user_uno.save
    assert_equal(80,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
    @user_uno.birthdate= Time.parse('1994-12-16 00:00:00')
    @user_uno.save
    assert_equal(75,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
    @user_uno.birthdate= Time.parse('2005-12-16 00:00:00')
    @user_uno.save
    assert_equal(85,@band_dos_test.sleep_quailit,'Correct Sleep quailit goal')
      
  end
end

=begin
birthdate: 1994-12-16 00:00:00

birthdate: 1992-12-16 00:00:00
birthdate: 1982-12-16 00:00:00
birthdate: 1977-12-16 00:00:00
birthdate: 1972-12-16 00:00:00
birthdate: 1967-12-16 00:00:00
birthdate: 1962-12-16 00:00:00
birthdate: 1957-12-16 00:00:00
birthdate: 1952-12-16 00:00:00
birthdate: 1940-12-16 00:00:00
birthdate: 1940-12-16 00:00:00
=end