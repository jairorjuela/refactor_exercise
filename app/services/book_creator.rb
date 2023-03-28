class BookCreator
  def initialize(params)
    @author = Author.find_by_id(params[:author_id])
    @title = params[:title]
    @description = params[:description]
  end

  def create
    return { error: 'Ivalid Author' } if @author.nil?

    create_book
  end

  private

  def create_book
    validate_params

    return validate_params if validate_params.instance_of?(Hash)

    book_action

    if @book.valid?
      @book.save

      { data: { title: @book.title, id: @book.id } }
    else
      { error: @book.errors.messages }
    end
  end

  def validate_params
    return { error: 'Ivalid title' } if @title.nil?

    return { error: 'Ivalid description' } if @description.nil?

    title_is_a_num = @title.to_i.positive?
    return { error: 'Is a num' } if title_is_a_num

    description_is_a_num = @description.to_i.positive?
    return { error: 'Is a num' } if description_is_a_num
  end

  def book_action
    @book = Book.new
    @book.author = @author
    @book.title = @title
    @book.description = @description
  end
end
