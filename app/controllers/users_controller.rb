class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    puts "#"*60
    puts params
    puts current_user
    puts "#"*60
    @user = current_user 
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user

  end

  def create
  end

  def update
    @user = current_user
    if @user.update(user_update)
      flash[:success] = "User succesfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
end
