require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class Books::Create::Do
  include Dry::Transaction(container: Container)

  step :validate,      with: 'books.create.validate'
  step :find_author,   with: 'books.create.find_author'
  step :action,        with: 'books.create.action'
end
