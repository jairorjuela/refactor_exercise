class AuthorCreator
  def initialize(params)
    @name = params[:name]
  end

  def create
    return { error: 'Ivalid Author' } if @name.nil?

    create_author
  end

  private

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

  def validate_params
    is_a_num = @name.to_i.positive?
    return { error: 'Is a num' } if is_a_num
  end

  def author_action
    @author = Author.new
    @author.name = @name
  end
end
