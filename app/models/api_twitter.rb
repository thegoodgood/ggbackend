class ApiTwitter < ApplicationRecord
  puts "start"

  # -------------------------------CONSTANTS------------------------------------
  CONSUMER_KEY= '50zFPAuzH9cqWBfZo6b1MykLn'
  CONSUMER_SECRET= 'UzK7OoeRk6yV5Rz9oCzBaA4PkdvzmYZQv63sGWI4dbrhE6PJcX'

  OA_TOKEN= '1089338169034788864-W50IFsQpp4FBZH6rrLia7aMIeib2oV'
  OA_SECRET= 'VZC3UQS0Aiy1L5Z8hE6jPlb8sMrARnN6O8CWMHBFXxjdz'

  GOODGOOD_ID = '1154600559510458368'
  @@bearer_token = 'Bearer AAAAAAAAAAAAAAAAAAAAAHIL%2FQAAAAAAPC1VDGL%2Bz44BlpFvnVyMrx2HBho%3D8x9hnvEra6QQbgGRAk8sBqrE4NlyVKmPucHBtLSofDSusNPlsj'

# ---------------------------------URLs----------------------------------------

  @@BASE_URI= 'https://api.twitter.com'
  USER_TWEETS_URL = '/labs/1/tweets'
  HOME_TIMELINE = '/1.1/statuses/home_timeline.json'
  CUSTOM_PROFILE = "https://api.twitter.com/1.1/custom_profiles/new.json"
  LIST = "https://api.twitter.com/1.1/lists/members/create_all.json"
  GG = "nygoodgood"

  @@consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, {
    site: 'https://api.twitter',
    scheme: :header
  })
  @@token_hash = {
    oath_token: OA_TOKEN,
    oath_token_secret: OA_SECRET
  }

  @@access_token = OAuth::AccessToken.from_hash(@@consumer, @@token_hash)

  # ----------------------------
  # def initialize
  #   consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, {
  #     site: 'https://api.twitter',
  #     scheme: :header
  #   })
  #   token_hash = {
  #     oath_token: OA_TOKEN,
  #     oath_token_secret: OA_SECRET
  #   }
  #   @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
  # end


  response = []

  def self.home_timeline
    JSON.parse(`twurl /1.1/statuses/home_timeline.json`)
  end

  def self.timelineeee options= nil
    return response =  JSON.parse(@@access_token.request(:get,
      'https://api.twitter.com/1.1/statuses/lookup.json?id=1050118621198921728/',
    options)
    .body)
  end


  def self.hashtagTweets(hashtag)
    # byebug
    query = {
      "q" => "%#{hashtag}"
    }
    headers = {
      "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAHIL%2FQAAAAAAPC1VDGL%2Bz44BlpFvnVyMrx2HBho%3D8x9hnvEra6QQbgGRAk8sBqrE4NlyVKmPucHBtLSofDSusNPlsj"
    }

    response = HTTParty.get(
      "https://api.twitter.com/1.1/search/tweets.json",
      :query => query,
      :headers => headers
    )
    JSON.parse(response.body)
  end



  def self.home_line options=nil
    return response =  JSON.parse(@@access_token.request(:get,
      'https://api.twitter.com/1.1/lists/statuses.json?list_id=1154600559510458368&count=3&include_rts=false',
    options)
    .body)
  end



def self.sc_tweets options=nil
  return response =  JSON.parse(@@access_token.request(:get, 'https://api.twitter.com/1.1/lists/statuses.json?list_id=1154600559510458368&count=2',
  options)
  .body)

end

def self.addSingleMember(list_slug, list_id, screen_name)
  return response = JSON.parse(@@access_token.request(:post, "https://api.twitter.com/1.1/lists/members/create.json?slug=#{list_slug}&owner_screen_name=nygoodgood&screen_name=#{screen_name}")
  .body)
end


end
