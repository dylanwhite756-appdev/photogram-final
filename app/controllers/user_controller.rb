class UserController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render("users/index.html.erb")
  end

  def profile
    @current_user = User.where( { :id => session[:user_id]}).at(0)
    @user_photos = Photo.where({ :owner_id => @current_user.id}).order({ :updated_at => :desc })

    render("users/profile.html.erb")
  end
end
