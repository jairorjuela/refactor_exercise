class Author < ApplicationRecord
  include StringValidations

  validates :name, format: { with: proc { |w| w.regex_valid_name }, multiline: true }
  validates :name, format: { without: proc { |w| w.regex_insecure_string } }

  has_many :books
end
