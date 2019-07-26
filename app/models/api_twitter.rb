require 'rubygems'
require 'oauth'
require 'json'

class ApiTwitter
  puts "start"
  CONSUMER_KEY= '50zFPAuzH9cqWBfZo6b1MykLn'
CONSUMER_SECRET= 'UzK7OoeRk6yV5Rz9oCzBaA4PkdvzmYZQv63sGWI4dbrhE6PJcX'

OA_TOKEN= '1089338169034788864-W50IFsQpp4FBZH6rrLia7aMIeib2oV'
OA_SECRET= 'VZC3UQS0Aiy1L5Z8hE6jPlb8sMrARnN6O8CWMHBFXxjdz'
  BASE_URI= 'https://api.twitter/1.1'

  def initialize
    consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, {
      site: 'https://api.twitter',
      scheme: :header
    })
    token_hash = {
      oath_token: OA_TOKEN,
      oath_token_secret: OA_SECRET
    }
    @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
  end

# GET Tweets FROM GENERAL ENDPOINT

  values = []

  def home_line options=nil
    return values =  JSON.parse(@access_token.request(:get, 'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=crissles&count=3',
    options)
    .body)

    home_line.map do |tweet|
    Tweet.create(
      tweet_id: tweet['id_str'],
      created_at: tweet['created_at'],
      lang: tweet['user']['lang'],
      user_name: tweet['user']['name'],
      user_profile_id: tweet['user']['id_str'],
      handle:tweet['user']['screen_name'],
      content:tweet['text'],
      profile_img_url: tweet["user"]["profile_image_url_https"],
      location: tweet['user']['location'],
      favorites:tweet['user']['favorite_count'],
      retweets: tweet['user']['retweet_count'],
      user_mentions:tweet['entities']['user_mentions'],
      urls: tweet['entities']['urls'],
      hashtags: tweet['entities']['hashtags'],
      media: tweet['entities']['media']
    )
  end
end

def new_list(name)
  return values = JSON.parse(@access_token.request(:post, 'https://api.twitter.com/1.1/lists/create.json?name='+ name + '&mode=public&description=none')
  .body)
end

def addSingleMember(list_id, screen_name)
  return values = JSON.parse(@access_token.request(:post, 'https://api.twitter.com/1.1/lists/members/create.json?slug=team&owner_screen_name=nygoodgood&screen_name='+ screen_name)
  .body)
end

def addMultipleMembers(list_id, screen_names)
  return values = JSON.parse(@access_token.request(:post, 'https://api.twitter.com/1.1/lists/members/create_all.json?screen_name=+screen_names+&list_id=23')
  .body)
end

def get_tweets_from_hashtag(hastag)

end

def my_lists
  return values = JSON.parse(@access_token.request(:get,'https://api.twitter.com/1.1/lists/ownerships.json?screen_name=nycgoodgood&count=1')
  .body)

  my_lists.map do |list|
    Username.create(password_digest: )
  end

end
end
