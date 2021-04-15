class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def show
    @books = Book.all
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.permit(:name, :profile_image, :introduction)
  end

end