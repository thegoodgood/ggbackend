class TwitterAccountsController < ApplicationController
skip_before_action :index
before_action :get_params

  def index
    twitter_accounts = TwitterAccounts.all
    render json: twitter_accounts
  end

private
  def get_params
    params.require(:twitter_account).permit(:name, :screen_name,:topic)
  end


end
