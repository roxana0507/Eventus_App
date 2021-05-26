json.extract! menu, :id, :name, :description, :image, :event_id, :created_at, :updated_at
json.url menu_url(menu, format: :json)
json.image url_for(menu.image)
