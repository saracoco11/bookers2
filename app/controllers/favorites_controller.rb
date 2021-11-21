class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
    @favorite.save
    redirect_to books_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @favorite.destroy
    #@favorite_count = Favorite.where(book_id: @book.id).count
    redirect_to books_path
  end
  
 

end
