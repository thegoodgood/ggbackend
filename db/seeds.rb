

# --------------------------CREATE HASHTAGS
def create_hashtags
  hashtags = ['TweetLikeJadenSmith', 'BlackHogwarts', 'ThanksgivingWithBlackFamilies', 'GrowingUpBlack ', 'HotGirlSummer', 'blacktwitterHistory', 'strongblackwomen', 'PaulasBestDishes ', 'Tyrone', 'BlackLivesMatter', 'OscarsSoWhite', 'BlackGirlMagic', 'Ilovemyblackness', 'IStandWithAhmed', 'BringBackOurGirls', 'blackpanthersolit', 'BestOfThrowbackBlackTwitter', 'LivingWhileBlack ', 'BrownSkinGirl', 'blackgirlmagic', 'blackfamily', 'blackexcellence', 'blackpride', 'whitetwitter', 'DearWhitePeople ']

  hashtags.map do |ht|
    Hashtag.create(keyword:ht)
  end
end
#-----------------------------TOPICS

topics = ["social Commentary", "OnTheDaily", "BGM"]

#--------------------------ADD TWITTER ACCOUNTs
def add_accounts
  scList =['deray', 'Nettaaaaaaaa', 'MsPackyetti', 'iKaylaReed', 'deray', 'kidnoble', 'iBree_Rich']

  otdList = ['jackieaina ‏', 'jess_hilarious ', 'KidFury ‏', 'crissles ‏', 'joanneprada', 'DemetriusHarmon', 'WannasWorld']

  scList.map do |act|
    TwitterAccount.create(screen_name:act, name: "", topic:"Social Commentary")
  end

  otdList.map do |act|
    TwitterAccount.create(screen_name:act, name: "", topic:"")
  end

end


def add_twitter_lists
  List.create(
    "id_str": "1154600559510458368",
    "name": "socialcommentary",
    "mode":"public",
    "description":""
  )
end


add_accounts
create_hashtags
add_twitter_lists

# def generateBrewery
#   brewery_info = []
#   for id in (1352..4271)
#     begin
#       response_string = RestClient.get("https://api.openbrewerydb.org/breweries/#{id}")
#       puts "brewery id: #{id}"
#     rescue RestClient::ExceptionWithResponse => e
#       puts "error from id: #{id}"
#       puts e.response.body
#       next
#     end
#     response_hash = JSON.parse(response_string)
#     brewery_info.push(response_hash)
#     Brewery.create(
#       id: "#{brewery_info.last["id"]}",
#       name: "#{brewery_info.last["name"]}",
#       brewery_type: "#{brewery_info.last["brewery_type"]}",
#       street: "#{brewery_info.last["street"]}",
#       city: "#{brewery_info.last["city"]}",
#       state: "#{brewery_info.last["state"]}",
#       postal_code: "#{brewery_info.last["postal_code"]}",
#       country: "#{brewery_info.last["country"]}",
#       longitude: "#{brewery_info.last["longitude"]}",
#       latitude: "#{brewery_info.last["latitude"]}",
#       phone: "#{brewery_info.last["phone"]}",
#       website_url: "#{brewery_info.last["website_url"]}",
#     )
#     # Review.create(brewery_id: "#{id}", user_id: "#{user_id}")
#   end
# end
# generateBrewery
