class ApiNews < ApplicationRecord
  puts "start"
  # -------------------------------CONSTANTS------------------------------------
  API_KEY= "579ac697a7ea49eeb64fc8913b200476"
# ---------------------------------URLs----------------------------------------

  response = []

  def self.get_news
    newsapi = News.new("579ac697a7ea49eeb64fc8913b200476")
    top_headlines = newsapi.get_top_headlines(q: 'bitcoin',
                                        sources: 'google-news',
                                        category: 'business',
                                        language: 'en',
                                        country: 'us')

    response = HTTParty.get(
      "https://newsapi.org/v2/everything?q=site:theroot.com?sources=google-news&apiKey=579ac697a7ea49eeb64fc8913b200476"
    )
    JSON.parse(response.body)
  end

end
