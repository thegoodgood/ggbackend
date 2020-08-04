require 'pry'
class UsersController < ApplicationController
skip_before_action :authorized, only: [:create, :index]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(username:params[:username], password: params[:password])
    if user.valid?
      user.save
      render json: { token: encode_token(user_payload(user))}
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def profile
    # render json: { current_user: UserSerializer.new(current_user) }, status: :accepted #<----sylwia way

    render json: self.current_user(), include: "**" #<--Kevin way
  end

  # def edit

  #   user = User.find(params[:id])
  # end

  def update
    user = User.find(params[:id])

    if current_user.update(username:params[:username])

      render json: self.current_user(), include: "**"
  else
    render json: { message: "Please log in" }, status: :unauthorized
  end
end

  private

  def get_params
    # params.permit(:username, :password) <---require?
    params.require(:user).permit(:username, :password)
  end

end
