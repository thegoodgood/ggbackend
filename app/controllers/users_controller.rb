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

#   def current_user
#     User.find(decoded_token[0]["user_id"])
#   end
#     ## TODO: ERROR--"#<NoMethodError: undefined method `user_Payload' for
# Did you mean?  user_path>"


  def profile
    render json: current_user, include: "**"
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
