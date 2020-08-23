class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def create
  end

  def index
  end

  def edit
    @user = User.find[params[:id]]
  end

  def update
  end

  private
  def user_params
  	params.require(:user).permit(:name, :image, :introduction)
  end
end
