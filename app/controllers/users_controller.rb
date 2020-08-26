class UsersController < ApplicationController
  def new
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:complete]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end