class TwitterAccountsController < ApplicationController

  def index
    twitter_accounts = TwitterAccounts.all
    render json: twitter_accounts
  end

end
