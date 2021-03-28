# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: %i[create destroy]

      def index
        render json: @books = Book.all
      end

      def create
        @book = @author.books.new(book_params)
        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @book = @author.books.find_by(params[:author_id])
        if @book
          @book.destroy
        else
          render json: { book: 'not found' }, status: :not_found
        end
      end

      private

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @author = Author.find_by(token: token)
        end
      end

      def book_params
        params.require(:book).permit(:title, :author_id)
      end
    end
  end
end
