require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class Authors::Create::Do
  include Dry::Transaction(container: Container)

  step :validate,      with: 'authors.create.validate'
  step :action,        with: 'authors.create.action'
end
