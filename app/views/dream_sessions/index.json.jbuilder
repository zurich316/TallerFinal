json.array!(@dream_sessions) do |dream_session|
  json.extract! dream_session, :id, :time_started, :time_finished, :user_id, :band_id
  json.url dream_session_url(dream_session, format: :json)
end
