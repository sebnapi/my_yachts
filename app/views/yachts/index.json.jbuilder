json.array!(@yachts) do |yacht|
  json.extract! yacht, :id, :name, :length_m, :length_f, :manufacture_year, :country, :builder, :description, :picture
  json.url yacht_url(yacht, format: :json)
end
