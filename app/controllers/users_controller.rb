class UsersController < ApplicationController
  before_action :balia_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  end


  def update
    if @user.update(user_params)
     redirect_to user_path(@user)
     flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def balia_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


end