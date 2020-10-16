class GameController < ApplicationController
  def index
    # @games = Game.includes(:genre)
    #            .includes(game_publishers: :publishers).includes(game_platforms: :platforms).all

    @games = Game.includes(:genre, game_publishers: [:publisher, game_platforms: [:platform, region_sales: :region]])
                 .order(:game_name).page(params[:page]).all
  end

  def show
    @game = Game.find(params[:id])
    @show_link = false
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @games = Game.where("game_name LIKE ?", wildcard_search)
  end
end
