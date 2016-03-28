json.array!(@business_messages) do |business_message|
  json.extract! business_message, :id, :title, :content, :user_id
  json.url business_message_url(business_message, format: :json)
end
