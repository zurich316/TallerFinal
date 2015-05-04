json.array!(@goals) do |goal|
  json.extract! goal, :id, :user_id, :type, :burned_calories, :hearth_rate, :total_time, :time_started, :time_finished
  json.url goal_url(goal, format: :json)
end
