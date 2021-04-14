class BooksController < ApplicationController
  
  def new
  end 
  
  def create
  end 
  
  def index
    @books = Book.all
    @book = Book.new
  end 
  
  def show
    @book = Book.find(params[:id])
  end 
  
  def destroy
  end 
  
end
