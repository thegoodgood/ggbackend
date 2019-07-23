# require "ActionController"
class ApplicationController < ActionController::API
  # before_action :authorized

  def encode_token(payload)
    JWT.encode payload, "my_secret", "HS256"
  end

  def user_payload(user)
    {user_id: user.id}
  end

  def secret
    ENV["my_secret"]
  end

  def token
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
    User.find(decoded_token[0]["user_id"]) if decoded_token
  end


  def logged_in?
  !!current_user
end

def authorized
  render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
end


end
  #
  # def create
  #   @user = Username.create(get_params)
  #
  #   if @username.valid?
  #     render json: { username: UsernameSerializer.new(@username) }, status: :created
  #   else
  #     render json: {error: 'failed to create username'}, status: :not_acceptable
  #   end
  # end
  #
  # private
  #
  # def get_params
  #   params.require(:username).permit(:username, :password)
  # end
# end
