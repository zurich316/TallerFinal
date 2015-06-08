json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :message, :turn
  json.url alarm_url(alarm, format: :json)
end
