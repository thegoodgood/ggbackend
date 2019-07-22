# require "ActionController"
class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode payload, "my_secret", "HS256"
  end

  def username_payload(username)
    {username_id: username.id}
  end

  def secret
    ENV["my_secret"]
  end

  def token
    request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode token, "my_secret", true, {algorithm: "HS256"}
  end

#   def logged_in?
#   !!current_user
# end


end
  #
  # def create
  #   @username = Username.create(get_params)
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
