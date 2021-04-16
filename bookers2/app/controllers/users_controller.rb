class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
