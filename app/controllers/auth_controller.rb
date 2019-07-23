class AuthController < ApplicationController

  # skip_before_action :authorized, only: :create


#   def login
#     user = User.find_by(username: params[:username])
#     is_authenticated = user.authenticate(params[:password])
#
#     if is_authenticated
#       render json: { token: encode_token(user_payload(user))}
#     else
#       render json: {error: "Wrong username and/or password. Sorry! "}
#     end
#   end
# end

# TODO: Why only the create action?

def create
   user = User.find_by(username: params[:username])
   is_authenticated = nil
   is_authenticated = user.authenticate(params[:password]) if user

   if is_authenticated
     render json: { token: encode_token(user) }
   else
     render json: { error: "Wrong username and/or password. Sorry!" }
   end
end
end
