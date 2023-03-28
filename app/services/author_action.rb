module AuthorAction
  def create_author
    validate_params

    return validate_params if validate_params.instance_of?(Hash)

    author_action

    if @author.valid?
      @author.save

      { data: { name: @author.name, id: @author.id } }
    else
      { error: @author.errors.messages }
    end
  end

  def author_action
    @author = Author.new
    @author.name = @name
  end
end
