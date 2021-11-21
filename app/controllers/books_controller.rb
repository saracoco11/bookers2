class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :currect_user, only: [:edit, :update]
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @favorite = Favorite.new
    #@favorite_count = Favorite.where(book_id: @book.id).count
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
    @favorite = Favorite.new
    @favorite_count = Favorite.where(book_id: @book.id).count
    @book_comments = @book.book_comments
    @comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def currect_user
    @book = Book.find(params[:id])
    @user = @book.user
    if current_user != @user
      redirect_to books_path
    end
  end


end