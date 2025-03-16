require 'flickraw'

class PhotosController < ApplicationController

  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']
    album_ids = ENV['FLICKR_ALBUM_IDS'].split(',')
    # fetch all albums simultaneously in parallel threads
    albums = [nil] * album_ids.length
    Parallel.each_with_index(album_ids, in_threads: album_ids.length) { |album_id, index|
      albums[index] = flickr.photosets.getPhotos(:photoset_id => album_id)
    }
    render json: albums
  end
  
end
