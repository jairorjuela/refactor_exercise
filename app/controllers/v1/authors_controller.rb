module V1
  class AuthorsController < ApplicationController
    def create
      authors = AuthorCreator.new(authors_params).create

      render json: authors
    end

    private

    def authors_params
      params.permit(:name)
            .to_h.symbolize_keys
    end
  end
end
