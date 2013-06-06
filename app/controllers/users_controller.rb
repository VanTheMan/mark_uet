class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_or_create(params[:user])
      redirect_to root_path
    end
  end

  def subcribe
    if @user = User.find_or_create({email: params[:user][:email]})
      subjects = params[:user][:subjects_subcribe].split(',')
      subjects.each do |s|
        # if @subject = Subject.search(s)
          @user.subjects << @subject
          @user.save
        # end
      end
      redirect_to root_path
    end
  end
end