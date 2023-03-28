class Book < ApplicationRecord
  include StringValidations

  validates :title, format: { with: proc { |w| w.regex_valid_name }, multiline: true }
  validates :title, :description, format: { without: proc { |w| w.regex_insecure_string } }
  validates :description, format: { with: proc { |w| w.regex_valid_note }, multiline: true }

  belongs_to :author
end
