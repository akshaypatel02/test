json.array!(@blog_articals) do |blog_artical|
  json.extract! blog_artical, :id, :title, :author, :text
  json.url blog_artical_url(blog_artical, format: :json)
end
