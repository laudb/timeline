class Article < ActiveRecord::Base
  
  def fetch
  
    require 'open-uri'
    require 'simple-rss'

    #array contains rss links
    url = ['http://feeds.theguardian.com/theguardian/football/rss',
           'http://sports.yahoo.com/soccer//rss.xml',
           'http://sports.espn.go.com/espn/rss/news'
          ]
      
    #loop through each link
    url.each do
      # save rss data from website into 'rss'
      rss = SimpleRSS.parse open(url)

        # iterate through feed. Save title, link, description
        rss.items.each do |r|

          t = r.title.force_encoding("UTF-8")
          l = r.link.force_encoding("UTF-8")
          d = r.description.force_encoding("UTF-8")

            @article = Article.create(title: t, link: l, description: d)
        end 
    end
  end
end
