json.array!(@sessions) do |session|
  json.extract! session, :id, :user_id, :type_sessiongoer_id, :type_session_id, :burned_calories, :hearth_rate, :total_time, :time_started, :time_finished
  json.url session_url(session, format: :json)
end
