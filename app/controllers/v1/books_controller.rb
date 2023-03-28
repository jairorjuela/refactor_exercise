module V1
  class BooksController < ApplicationController
    def create
      books = Books::Create::Do.new.({ title: books_params[:title], description: books_params[:description], author_id: books_params[:author_id] })

      if books.success?
        render json: books.success
      else
        render json: books.failure
      end
    end

    private

    def books_params
      params.permit(:author_id, :title, :description)
            .to_h.symbolize_keys
    end
  end
end
