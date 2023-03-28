require "dry/transaction"
require "dry/transaction/operation"

class Authors::Create::Action
  include Dry::Transaction

  def call(input)
    author = create_author(input)

    if author.valid?
      author.save
      message = { data: { name: author.name, id: author.id } }

      Success message
    else
      Failure ({ error: author.errors.messages })
    end
  end

  private

  def create_author(input)
    author = Author.new
    author.name = input[:name]
    author
  end
end
