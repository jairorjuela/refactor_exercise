class AuthorCreator
  include AuthorValidator
  include AuthorAction

  def initialize(params)
    @name = params[:name]
  end

  def create
    return { error: 'Ivalid Author' } if @name.nil?

    create_author
  end
end
