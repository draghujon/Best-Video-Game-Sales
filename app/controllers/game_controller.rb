class GameController < ApplicationController
  def index
    @games = Game.includes(:genre, game_publishers: [:publisher, game_platforms: [:platform, region_sales: :region]])
                 .order(:num_sales).page(params[:page]).all
    #@genres = Genre.order(:genre_name).all
  end

  def show
    @game = Game.find(params[:id])
    @show_link = false
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @genre_search = ""
    if params[:genre].empty?
      @games = Game.where("game_name LIKE ?", wildcard_search)
    else
      @genre_search = Genre.where("id = ?", params[:genre]).first.genre_name
      @games = Game.where("game_name LIKE ?", wildcard_search)
                   .where("genre_id = ?", params[:genre])
    end
  end
end
