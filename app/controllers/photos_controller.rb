require 'flickraw'

class PhotosController < ApplicationController

  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']
    photoset = flickr.photosets.getPhotos(:photoset_id => '72157710380746362')
    render json: photoset
  end
end
