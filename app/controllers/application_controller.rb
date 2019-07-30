# require "ActionController"
class ApplicationController < ActionController::API

  before_action :authorized

  def encode_token(user)
    JWT.encode(user_payload(user), "my_secret", "HS256")
    # JWT.encode payload, "my_secret", "HS256"
  end

  def user_payload(user)
    { user_id: user.id }
  end

  def token
# byebug
   request.headers["Authorization"].split(' ')[1] if request.headers["Authorization"]
 end

 def decoded_token
  begin
    JWT.decode token, "my_secret", true, { algorithm: "HS256" }
  rescue JWT::DecodeError
    nil
  end
end

def current_user
  # byebug
  # current_user = User.find_by(username: params[:username])
  User.find(decoded_token[0]["user_id"]) if decoded_token #<--kevin way
end

def logged_in?
  # byebug
  !!current_user
end

def authorized
  render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
end
  end
