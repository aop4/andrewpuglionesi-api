require 'flickraw'

class PhotosController < ApplicationController

  PHOTOSET_ID = '72157710380746362'

  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']
    photoset = flickr.photosets.getPhotos(:photoset_id => PHOTOSET_ID)
    render json: photoset
  end
end
