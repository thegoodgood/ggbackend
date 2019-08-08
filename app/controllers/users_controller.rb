require 'byebug'
class UsersController < ApplicationController
skip_before_action :authorized, only: [:create, :index]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(get_params)
    if user.valid?
      render json: { token: encode_token(user_payload(user))}
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def profile

    # render json: { current_user: UserSerializer.new(current_user) }, status: :accepted  #<----sylwia way

    render json: self.current_user(), include: "**" #<--Kevin way
  end

  private

  def get_params
    params.permit(:username, :password)
  end

end
