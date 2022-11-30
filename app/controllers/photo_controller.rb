class PhotoController < ApplicationController
  def index
    matching_photos = Photo.all

    @feed = matching_photos.order({ :created_at => :desc })
    render("photos/feed.html.erb")
  end
end
