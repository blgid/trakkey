json.array!(@facilities) do |facility|
  json.extract! facility, :id, :title, :description
  json.url facility_url(facility, format: :json)
end
