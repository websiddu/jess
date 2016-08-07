json.array!(@settings) do |setting|
  json.extract! setting, :about, :blurb, :text, :pic
  json.url setting_url(setting, format: :json)
end
