require 'test_helper'

class BandInformationTest < ActiveSupport::TestCase
  setup do
  	@user1 = band_informations(:one)
  	@user2 = band_informations(:two)
  	@user3 = band_informations(:three)
  	@user4 = band_informations(:four)
  	@user5 = band_informations(:five)
  	@user6 = band_informations(:six)
  	@user7 = band_informations(:seven)
  	@user8 = band_informations(:eight)
  	@user9 = band_informations(:nine)
  	@user10 = band_informations(:ten)
  	@user11 = band_informations(:eleven)
  	@user12 = band_informations(:twelve)
  	@user13 = band_informations(:thirteen)
  	@user14 = band_informations(:fourteen)
  	@user15 = band_informations(:fifteen)
  	@user16 = band_informations(:sixteen)
  	@user17 = band_informations(:seventeen)
  	@user18 = band_informations(:eighteen)
  	@user19 = band_informations(:nineteen)
  	@user20 = band_informations(:twenty)
  end

  test "Heart rate alert" do
  	assert_equal(true, @user1.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user2.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user3.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user4.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user5.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user6.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user7.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user8.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user9.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user10.alarma?, 'Heart rate alarm' )
  end

  test "No heat rate alarm" do
  	assert_equal(false, @user11.alarma?, 'No alarm' )
    assert_equal(false, @user12.alarma?, 'No alarm' )
    assert_equal(false, @user13.alarma?, 'No alarm' )
    assert_equal(false, @user14.alarma?, 'No alarm' )
    assert_equal(false, @user15.alarma?, 'No alarm' )
    assert_equal(false, @user16.alarma?, 'No alarm' )
    assert_equal(false, @user17.alarma?, 'No alarm' )
    assert_equal(false, @user18.alarma?, 'No alarm' )
    assert_equal(false, @user19.alarma?, 'No alarm' )
    assert_equal(false, @user20.alarma?, 'No alarm' )
  
  end

  # test "the truth" do
  #   assert true
  # end
end
