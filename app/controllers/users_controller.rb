class UsersController < ApplicationController
  def new
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:complete]="User was successfully updated."
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end