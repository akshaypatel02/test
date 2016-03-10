json.array!(@messages) do |message|
  json.extract! message, :id, :title, :content, :category, :user_id
  json.url message_url(message, format: :json)
end
