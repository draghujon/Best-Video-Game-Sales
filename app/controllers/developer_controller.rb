class DeveloperController < ApplicationController
  def index
    @games = Game.includes(:genre, game_publishers: [:publisher, game_platforms: [:platform, region_sales: :region]]).all
  end

  def show
    @game = Game.find(:game_dev, params[:id])
  end
end
