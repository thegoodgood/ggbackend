class AuthController < ApplicationController

  def login
    username = Username.find_by(name: params[:name])
    is_authenticated = username.authenticate(params[:password])

    if is_authenticated
      # payload = username_payload(username)

      render json: { token: encode_token(username_payload(username))}

    else
      render json: {error: "Wrong username and/or password. Sorry! "}
    end
  end
end
