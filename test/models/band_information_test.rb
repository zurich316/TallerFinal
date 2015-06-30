#Band information registers' tests
require 'test_helper'

class BandInformationTest < ActiveSupport::TestCase
  setup do
  	@user_uno = band_informations(:one)
  	@user_dos = band_informations(:two)
  	@user_tres = band_informations(:three)
  	@user_cuatro = band_informations(:four)
  	@user_cinco = band_informations(:five)
  	@user_seis = band_informations(:six)
  	@user_siete = band_informations(:seven)
  	@user_ocho= band_informations(:eight)
  	@user_nueve = band_informations(:nine)
  	@user_diez = band_informations(:ten)
  	@user_once = band_informations(:eleven)
  	@user_doce = band_informations(:twelve)
  	@user_trece = band_informations(:thirteen)
  	@user_catorce = band_informations(:fourteen)
  	@user_quince = band_informations(:fifteen)
  	@user_dieciseis = band_informations(:sixteen)
  	@user_diecisiete = band_informations(:seventeen)
  	@user_dieciocho = band_informations(:eighteen)
  	@user_diecinueve = band_informations(:nineteen)
  	@user_veinte = band_informations(:twenty)
  end

  test "Heart rate alert" do
  	assert_equal(true, @user_uno.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_dos.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_tres.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_cuatro.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_cinco.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_seis.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_siete.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_ocho.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_nueve.alarma?, 'Heart rate alarm' )
	assert_equal(true, @user_diez.alarma?, 'Heart rate alarm' )
  end

  test "No heat rate alarm" do
  	assert_equal(false, @user_once.alarma?, 'No alarm' )
    assert_equal(false, @user_doce.alarma?, 'No alarm' )
    assert_equal(false, @user_trece.alarma?, 'No alarm' )
    assert_equal(false, @user_catorce.alarma?, 'No alarm' )
    assert_equal(false, @user_quince.alarma?, 'No alarm' )
    assert_equal(false, @user_dieciseis.alarma?, 'No alarm' )
    assert_equal(false, @user_diecisiete.alarma?, 'No alarm' )
    assert_equal(false, @user_dieciocho.alarma?, 'No alarm' )
    assert_equal(false, @user_diecinueve.alarma?, 'No alarm' )
    assert_equal(false, @user_veinte.alarma?, 'No alarm' )
  end

  test "Push alarm" do
  	assert_equal({}, @user_nueve.heart_rate_high, 'Heart rate alarm' )
  end

  test "No push alarm" do
	assert_equal(nil, @user_once.heart_rate_high, 'No alarm' )
  end

  # test "the truth" do
  #   assert true
  # end
end
