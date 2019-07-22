# require 'byebug'
class UsernamesController < ApplicationController

  def create
    username = Username.create(get_params)

    if username.valid?
      render json: { token: encode_token(username_Payload(username))}
    else
      render json: {errors: username.errors.full_mesages}
    end
  end

  def current_user
    ## TODO: having current user in application controller makes tweets unavailable
    Username.find(decoded_token[0]["username_id"])
  end

  def profile
    if current_user
      render json: current_user
  end

  def index
    usernames = Username.all
    render json: usernames
  end

  private

  def get_params
    params.permit(:name, :password)
  end

end
