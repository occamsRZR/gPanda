class UsersController < ApplicationController
  def new
    @title = "Sign up"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @jobs = @user.jobs
  end
  
  def index
    @users = User.all
  end

end
