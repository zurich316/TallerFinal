require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @session = sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post :create, session: { burned_calories: @session.burned_calories, hearth_rate: @session.hearth_rate, time_finished: @session.time_finished, time_started: @session.time_started, total_time: @session.total_time, type_session_id: @session.type_session_id, type_sessiongoer_id: @session.type_sessiongoer_id, user_id: @session.user_id }
    end

    assert_redirected_to session_path(assigns(:session))
  end

  test "should show session" do
    get :show, id: @session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session
    assert_response :success
  end

  test "should update session" do
    patch :update, id: @session, session: { burned_calories: @session.burned_calories, hearth_rate: @session.hearth_rate, time_finished: @session.time_finished, time_started: @session.time_started, total_time: @session.total_time, type_session_id: @session.type_session_id, type_sessiongoer_id: @session.type_sessiongoer_id, user_id: @session.user_id }
    assert_redirected_to session_path(assigns(:session))
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete :destroy, id: @session
    end

    assert_redirected_to sessions_path
  end
end
