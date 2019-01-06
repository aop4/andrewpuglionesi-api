class AlbumsController < ApplicationController

  def index
      @albums = Album.order(release_date: :desc)
      render json: @albums.to_json(:include => :songs)
  end

  def show
    @album = Album.find(params[:id])
  end
end
