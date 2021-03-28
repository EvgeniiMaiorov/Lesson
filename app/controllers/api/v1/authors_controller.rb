# frozen_string_literal: true

module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        render json: @authors = Author.all
      end

      def show
        render json: @author
      end

      def create
        @author = Author.new(author_params)
        if @author.save
          render status: :created
        else
          render json: @author.errors, status: unprocessable_entity
        end
      end

      def update
        if @author.update(author_params)
          render json: @author
        else
          render json: { errors: @author.errors.full_message }
        end
      end

      def destroy
        render json: @author.destroy
      end

      private

      def author_params
        params.require(:author).permit(:name)
      end
    end
  end
end
