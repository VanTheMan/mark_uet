class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_or_create(params[:user])
      redirect_to root_path
    end
  end
end