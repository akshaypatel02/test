json.array!(@private_messages) do |private_message|
  json.extract! private_message, :id, :to, :content, :user_id
  json.url private_message_url(private_message, format: :json)
end
