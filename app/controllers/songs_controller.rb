class SongsController < ApplicationController
  def update
    @song = Song.find(params[:id])

    download_count = params[:download_count]
    play_count = params[:play_count]

    if !download_count.nil? && download_count > 0
      # increment the download count
      @song.download_count += 1
    end
    if !play_count.nil? && play_count > 0
      # increment the play count
      @song.play_count += 1
    end
    
    @song.save
    render json: {}, status: :ok
  end
end
