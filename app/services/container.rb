require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class Container
  extend Dry::Container::Mixin

  namespace "books" do
    namespace "create" do
      register("validate")    { Books::Create::Validate.new }
      register("find_author") { Books::Create::FindAuthor.new }
      register("action")      { Books::Create::Action.new }
    end
  end

  namespace "authors" do
    namespace "create" do
      register("validate")    { Authors::Create::Validate.new }
      register("action")      { Authors::Create::Action.new }
    end
  end
end
