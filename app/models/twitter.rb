# require 'HTTParty'
class Twitter < ApplicationRecord


  def initialize
    @auth = 'Bearer  AAAAAAAAAAAAAAAAAAAAAHIL%2FQAAAAAAPC1VDGL%2Bz44BlpFvnVyMrx2HBho%3D8x9hnvEra6QQbgGRAk8sBqrE4NlyVKmPucHBtLSofDSusNPlsj'
  end


  def self.get_timeline( options = {})
    options = {"Authorization":'Bearer AAAAAAAAAAAAAAAAAAAAAHIL%2FQAAAAAAPC1VDGL%2Bz44BlpFvnVyMrx2HBho%3D8x9hnvEra6QQbgGRAk8sBqrE4NlyVKmPucHBtLSofDSusNPlsj'
    }
  options.merge!({ basic_auth: options })
  byebug
    response = HTTParty.get("https://twitter.com/1.1/statuses/home_timeline.json?q", options)
    .body
  end

  # def post(text)
  #
  #   options = { query: { status: text }, basic_auth: @auth }
  #   self.class.post('/statuses/update.json', options)
  # end

end
