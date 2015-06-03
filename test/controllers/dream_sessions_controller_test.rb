require 'test_helper'

class DreamSessionsControllerTest < ActionController::TestCase
  setup do
    @dream_session = dream_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dream_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dream_session" do
    assert_difference('DreamSession.count') do
      post :create, dream_session: { band_id: @dream_session.band_id, time_finished: @dream_session.time_finished, time_started: @dream_session.time_started, user_id: @dream_session.user_id }
    end

    assert_redirected_to dream_session_path(assigns(:dream_session))
  end

  test "should show dream_session" do
    get :show, id: @dream_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dream_session
    assert_response :success
  end

  test "should update dream_session" do
    patch :update, id: @dream_session, dream_session: { band_id: @dream_session.band_id, time_finished: @dream_session.time_finished, time_started: @dream_session.time_started, user_id: @dream_session.user_id }
    assert_redirected_to dream_session_path(assigns(:dream_session))
  end

  test "should destroy dream_session" do
    assert_difference('DreamSession.count', -1) do
      delete :destroy, id: @dream_session
    end

    assert_redirected_to dream_sessions_path
  end
end
