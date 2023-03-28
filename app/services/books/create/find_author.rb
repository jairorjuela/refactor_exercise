require "dry/transaction"
require "dry/transaction/operation"

class Books::Create::FindAuthor
  include Dry::Transaction

  def call(input)
    author = Author.find_by_id(input[:author_id])

    if author.present?
      Success input.merge!(author: author)
    else
      Failure ({ error: 'Invalid author' })
    end
  end
end
