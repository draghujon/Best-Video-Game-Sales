class PublisherController < ApplicationController
  def index
    @publishers = Publisher.includes(:games).all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
