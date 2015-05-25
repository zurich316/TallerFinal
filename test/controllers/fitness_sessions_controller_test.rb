require 'test_helper'

class FitnessSessionsControllerTest < ActionController::TestCase
  setup do
    @fitness_session = fitness_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fitness_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    assert_difference('FitnessSession.count') do
      post :create, fitness_session: { burned_calories: @fitness_session.burned_calories, hearth_rate: @fitness_session.hearth_rate, time_finished: @fitness_session.time_finished, time_started: @fitness_session.time_started, total_time: @fitness_session.total_time, type_session_id: @fitness_session.type_session_id, type_sessiongoer_id: @fitness_session.type_sessiongoer_id, user_id: @fitness_session.user_id }
    end

    assert_redirected_to fitness_session_path(assigns(:session))
  end

  test "should show session" do
    get :show, id: @fitness_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fitness_session
    assert_response :success
  end

  test "should update session" do
    patch :update, id: @fitness_session, fitness_session: { burned_calories: @fitness_session.burned_calories, hearth_rate: @fitness_session.hearth_rate, time_finished: @fitness_session.time_finished, time_started: @fitness_session.time_started, total_time: @fitness_session.total_time, type_session_id: @fitness_session.type_session_id, type_sessiongoer_id: @fitness_session.type_sessiongoer_id, user_id: @fitness_session.user_id }
    assert_redirected_to fitness_session_path(assigns(:fitness_session))
  end

  test "should destroy session" do
    assert_difference('FitnessSession.count', -1) do
      delete :destroy, id: @fitness_session
    end

    assert_redirected_to fitness_sessions_path
  end
end
