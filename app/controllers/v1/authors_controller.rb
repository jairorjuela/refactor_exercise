module V1
  class AuthorsController < ApplicationController
    def create
      authors = Authors::Create::Do.new.({ name: authors_params[:name] })

      if authors.success?
        render json: authors.success
      else
        render json: authors.failure
      end
    end

    private

    def authors_params
      params.permit(:name)
            .to_h.symbolize_keys
    end
  end
end
