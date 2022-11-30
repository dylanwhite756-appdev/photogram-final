class PhotoController < ApplicationController
  def index
    public_users = User.all.where({ :private => false})
    @public_user_ids = public_users.map_relation_to_array(:id)
    
    @feed = Photo.where({ :owner_id => @public_user_ids}).order({ :created_at => :desc })
    
    render("photos/feed.html.erb")
  end
end
