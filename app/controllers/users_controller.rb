# require 'byebug'
class UsersController < ApplicationController

  def create
    user = User.create(get_params)

    if user.valid?
      render json: { token: encode_token(user_Payload(user))}
    else
      render json: {message: 'Invalid user or password'}
    end
  end

  def current_user
    ## TODO: having current user in application controller makes tweets unavailable
    User.find(decoded_token[0]["user_id"])
  end

  def profile
    if current_user
      render json: current_user
    end
  end

  def index
    users = User.all
    render json: users
  end

  private

  def get_params
    params.permit(:username, :password)
  end

end
