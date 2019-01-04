class AlbumsController < ApplicationController

  def index
      @albums = Album.order(:release_date)
      render json: @albums.to_json(:include => :songs, :order => :track_no)
  end

  def show
    @album = Album.find(params[:id])
  end
end
