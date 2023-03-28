module AuthorValidator
  def validate_params
    is_a_num = @name.to_i.positive?
    return { error: 'Is a num' } if is_a_num
  end
end
