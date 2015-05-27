json.array!(@band_informations) do |band_information|
  json.extract! band_information, :id, :steps, :lat, :long, :user_id, :band_id
  json.url band_information_url(band_information, format: :json)
end
