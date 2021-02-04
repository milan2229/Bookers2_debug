class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    # @users = User.new
    @books = @user.books
    @book = Book.new

  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


def follower
  @user = User.find(params[:user_id])
  @users = @user.followed
  # @users = User.all
  # @users = User.find(params[:id])
end

def followed
  # @user = User.new
  @user = User.find(params[:user_id])
  @users = @user.follower
  # @users = User.all
end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
