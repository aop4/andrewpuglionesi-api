class SongsController < ApplicationController
  def update
    @song = Song.find(params[:id])
    @song.play_count += 1
    @song.save
    render json: {}, status: :ok
  end
end
