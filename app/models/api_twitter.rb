class ApiTwitter
  CONSUMER_KEY = ENV['CONSUMER_KEY']
  CONSUMER_SECRET = ENV['CONSUMER_SECRET']
  OA_TOKEN = ENV['OA_TOKEN']
  OA_SECRET = ENV['OA_SECRET']


  BASE_URI = 'https://api.twitter/1.1/'
  @uri = "https://api.twitter.com/labs/1/users?usernames=TwitterDev"

  def initialize
    byebug
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

  def home_line options=nil
    # JSON.parse(@access_token.request(:get, 'https://api.twitter/1.1/statuses/home/timeline.json',
  values =  JSON.parse(@access_token.request(:get, 'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=jobelixte&count=2',
  options)
  .body)
  puts values
  end


#
#
 # puts "done"

 # protected

 # check if current user has admin access
 # def current_user
 #   OpenStruct.new(admin?: false)
#   end
#   helper_method :current_user
 # end

 # private
end
