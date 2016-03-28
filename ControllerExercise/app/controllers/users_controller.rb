class UsersController < ApplicationController
  def index
    render json: user_params
  end

  def create
    render json: user_params
  end

  private
  def user_params
    params.require(:user).permit(:name, :height)
  end
end
