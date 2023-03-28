require "dry/transaction"
require "dry/transaction/operation"

class Authors::Create::Validate
  include Dry::Transaction

  def call(input)
    validator = Dry::Schema.Params do
      required(:name).filled(:string)
    end

    result = validator.(input)

    if result.success?
      Success input
    else
      message = parse_error(result.errors)
      Failure ({ error: message })
    end
  end

  private

  def parse_error(errors)
    errors.each_with_object([]) do |error, array|
      error_message = error.text
      path = error.path[0].to_s
      message = "#{path} #{error_message}"
      array << message
    end
  end
end
