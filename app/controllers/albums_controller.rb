class AlbumsController < ApplicationController

  def index
      @albums = Album.order(:release_date)
      render json: @albums
  end

  def new
  end

  def show
    @album = Album.find(params[:id])
  end
end
