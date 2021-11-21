class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :balia_user, only: [:edit, :update]

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
    @book_comments = @book.book_comments
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @user = current_user
    @favorite = Favorite.new
    @book_comments = @book.book_comments
    @comment = BookComment.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else

      redirect_to user_path
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def balia_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end
end