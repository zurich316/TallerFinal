require 'test_helper'

class BandInformationsControllerTest < ActionController::TestCase
  setup do
    @band_information = band_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_information" do
    assert_difference('BandInformation.count') do
      post :create, band_information: { band_id: @band_information.band_id, lat: @band_information.lat, long: @band_information.long, steps: @band_information.steps, user_id: @band_information.user_id }
    end

    assert_redirected_to band_information_path(assigns(:band_information))
  end

  test "should show band_information" do
    get :show, id: @band_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_information
    assert_response :success
  end

  test "should update band_information" do
    patch :update, id: @band_information, band_information: { band_id: @band_information.band_id, lat: @band_information.lat, long: @band_information.long, steps: @band_information.steps, user_id: @band_information.user_id }
    assert_redirected_to band_information_path(assigns(:band_information))
  end

  test "should destroy band_information" do
    assert_difference('BandInformation.count', -1) do
      delete :destroy, id: @band_information
    end

    assert_redirected_to band_informations_path
  end
end
