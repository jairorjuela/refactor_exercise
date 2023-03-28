require "dry/transaction"
require "dry/transaction/operation"

class Books::Create::Action
  include Dry::Transaction

  def call(input)
    book = create_book(input)

    if book.valid?
      book.save
      message = { data: { title: book.title, id: book.id } }

      Success message
    else
      Failure ({ error: book.errors.messages })
    end
  end

  private

  def create_book(input)
    book = Book.new
    book.author = input[:author]
    book.title = input[:title]
    book.description = input[:description]
    book
  end
end
