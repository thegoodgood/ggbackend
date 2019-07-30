class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # @@twitter_api = ApiTwitter.new
  #
  # def twitter_api
  #   @@twitter_api
  # end

end
