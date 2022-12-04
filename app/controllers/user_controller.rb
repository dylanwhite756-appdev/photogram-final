class UserController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render("users/index.html.erb")
  end

  def profile
    @the_user = User.where({ :username => params.fetch("username")}).at(0)
    @followers = FollowRequest.where({ :recipient_id => @the_user.id, :status => "accepted" })
    @followers_count = @followers.count
    @following = FollowRequest.where({ :sender_id => @the_user.id, :status => "accepted" })
    @following_count = @following.count
    @pending_followers = FollowRequest.where({ :recipient_id => @the_user.id, :status => "pending" })
    @user_photos = Photo.where({ :owner_id => @the_user.id}).order({ :created_at => :asc })

    render("users/profile.html.erb")
  end
end
