json.extract! resource, :id, :title, :author, :link, :created_at, :updated_at
json.url resource_url(resource, format: :json)