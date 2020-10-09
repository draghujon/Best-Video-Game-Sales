class GenreController < ApplicationController
  def index; end

  def show
    @genre = Genre.find(params[:id])
  end
end
