class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
  end

  def index
    @users = User.all
  end
end
