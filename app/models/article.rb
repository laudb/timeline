class Article < ActiveRecord::Base
  
  def fetch
  
    require 'open-uri'
    require 'simple-rss'

  # save rss data from website into 'rss'
    url = 'http://feeds.theguardian.com/theguardian/football/rss'
    rss = SimpleRSS.parse open(url)

  #iterate through feed save title into variable 
    rss.items.each do |r|

      t = r.title
      t.force_encoding("UTF-8")
      l =r.link
      l.force_encoding("UTF-8")
      d = r.description
      d.force_encoding("UTF-8")

      @article = Article.create(title: t, link: l, description: d)
  
    end 

  end
end
