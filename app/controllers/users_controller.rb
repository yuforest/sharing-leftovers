class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confrmation)
  end
  
  def set_users
    @user = User.find(params[:id])
  end
end
