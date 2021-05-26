json.extract! event, :id, :name, :kind, :created_at, :updated_at
json.url event_url(event, format: :json)
