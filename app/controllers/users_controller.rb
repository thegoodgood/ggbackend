# require 'byebug'
class UsersController < ApplicationController

  def create
    user = User.create(get_params)
    if user.valid?
      render json: { token: encode_token(user_payload(user))}
    else
      render json: {message: 'Invalid user or password'}
    end
  end

  def profile
    render json: current_user, include: "**"
  end

  private

  def get_params
    params.permit(:username, :password)
  end

end
