module V1
  class BooksController < ApplicationController
    def create
      books = BookCreator.new(books_params).create

      render json: books
    end

    private

    def books_params
      params.permit(:author_id, :title, :description)
            .to_h.symbolize_keys
    end
  end
end
