json.array!(@goals) do |goal|
  json.extract! goal, :id, :user_id, :type_id, :frequency, :goal, :time_started, :time_finished
  json.url goal_url(goal, format: :json)
end
