class GameController < ApplicationController
  def index
    # @games = Game.includes(:genre)
    #            .includes(game_publishers: :publishers).includes(game_platforms: :platforms).all

    @games = Game.includes(:genre, game_publishers: [:publisher, game_platforms: [:platform, region_sales: :region]]).all
    # .includes(:game_platform).all
    # .includes(:publishers).all
    # .includes(:game_platforms)
    # .includes(:platforms).all
    # .includes(:platform)
    # .includes(:publisher)
    # .includes(:region)
    # .includes(:region_sale).all
  end

  def show
    @game = Game.find(params[:id])
    @show_link = false
  end
end
