module StringValidations
  extend ActiveSupport::Concern

  def regex_valid_name
    /^[0-9a-zA-ZÑñáéíóúüÁÉÍÓÚ&-_ ]+$/
  end

  def regex_valid_note
    /^[0-9a-zA-ZÑñáéíóúüÁÉÍÓÚ&-_.,;:¿?¡!'"#$()% ]+$/
  end

  def regex_insecure_string
    /[<>$]/
  end
end
