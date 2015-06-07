json.array!(@goals) do |goal|
  json.extract! goal, :id, :user_id, :type_goal_id, :frequency, :goal, :time_started, :time_finished, :progress, :complete
  json.url goal_url(goal, format: :json)
end
