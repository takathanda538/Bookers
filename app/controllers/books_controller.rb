class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find_by(params[:id])
  end

  def edit
    @book = Book.find_by(params[:id])
  end
  
  def update
    book = Book.find_by(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  def destroy
    book = Book.find_by(params[:id])
    book.destroy
    redirect_to "/books"
  end
  
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
