json.array!(@emails) do |email|
  json.extract! email, :id, :email, :content
  json.url email_url(email, format: :json)
end
