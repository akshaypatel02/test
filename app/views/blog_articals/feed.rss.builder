#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "The name of your blog/website"
    xml.author "Your Name"
    xml.description "A description for your website"
    xml.link rel: "self", href: "https://benjamin-watson-push-src.herokuapp.com/feed.rss", type: "application/rss+xml"
    xml.link rel: "hub",  href: "http://finalproject.herokuapp.com"
    xml.link "https://benjamin-watson-push-src.herokuapp.com"
    xml.language "en"

    for article in @blog_articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author article.author
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "https://benjamin-watson-push-src.herokuapp.com/blog_articles/" + article.id.to_s # + "-" + article.alias
        xml.guid article.id

        text = article.text
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end