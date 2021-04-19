class UsersController < ApplicationController

  def new

  end

  def show
    #@book = Book.new
    #@book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book_new = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]='Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @books = Book.all
    @book = Book.new
    @book_new = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]='User_profile was successfully updated.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
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

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
