class BooksController < ApplicationController

  def new

  end

  def top
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]='Book was successfully created.'
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.save
      redirect_to edit_book_path(current_user.id)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]='Book was successfully updated.'
      redirect_to book_path(current_user.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @book_new = Book.new
    @book = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    #byebug
    @user = @book.user
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

  def user_params
    params.permit(:name, :profile_image, :introduction)
  end

end