class BooksController < ApplicationController
  def index 
    @books = Book.all.as_json
  end

  def show
    render json: @book
  end

  def create 
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render json: {errors: @book.errors.ful_message}
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: {errors: @book.errors.full_message}
  end

  def destroy
    render json: @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end
end
