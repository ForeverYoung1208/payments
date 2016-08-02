json.array!(@resourcers) do |resourcer|
  json.extract! resourcer, :id, :name
  json.url resourcer_url(resourcer, format: :json)
end
