class DeveloperController < ApplicationController
  def index
    @games = Game.includes(:genre, game_publishers: [:publisher, game_platforms: [:platform, region_sales: :region]]).map(&:game_dev).uniq
  end

  def show
    @game = Game.find(:game_dev, params[:id])
  end
end
