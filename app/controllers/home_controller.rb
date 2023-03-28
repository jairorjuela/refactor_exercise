class HomeController < ApplicationController
  def index
    render plain: 'Home Books'
  end
end
