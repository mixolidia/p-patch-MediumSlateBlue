json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :name, :starts_at
  json.url calendar_url(calendar, format: :json)
end
