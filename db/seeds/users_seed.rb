require 'typhoeus'
require 'oauth/request_proxy/typhoeus_request'

@uri = "https://api.twitter.com/labs/1/tweets?ids=1067094924124872705&format=detailed"
@options = {
    :method => :get,
    :headers => {
        "x-des-apiservices" => "staging2"
     }
}

@oauth_params = {:consumer => @consumer, :token => @access_token}
@hydra = Typhoeus::Hydra.new
@req = Typhoeus::Request.new(@uri, @options) # :method needs to be specified in options
@oauth_helper = OAuth::Client::Helper.new(@req, @oauth_params.merge(:request_uri => @uri))
@req.options[:headers].merge!({"Authorization" => @oauth_helper.header}) # Signs the request
@hydra.queue(@req)
@hydra.run
@response = @req.response

puts @response.body
