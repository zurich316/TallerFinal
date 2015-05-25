require 'test_helper'

class BandInfosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    setup do
    @band_info = band_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_infos)
  end

end
