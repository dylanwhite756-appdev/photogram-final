class PhotoController < ApplicationController
  def index
    public_users = User.all.where({ :private => false})
    @public_user_ids = public_users.map_relation_to_array(:id)
    
    @feed = Photo.where({ :owner_id => @public_user_ids}).order({ :created_at => :desc })
    
    render("photos/feed.html.erb")
  end

  def photo_page
    if @current_user == nil 
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    else
      @current_user = User.where( { :id => session[:user_id]}).at(0)
      the_photo_id = params.fetch("photo_id")
      @photo_for_page = Photo.where( {:id => the_photo_id}).at(0)
      @photo_owner = User.where( { :id => @photo_for_page.owner_id}).at(0)
      @comments_for_photo = Comment.where( { :photo_id => the_photo_id}).order({ :created_at => :asc })
      
      render("photos/photo_page.html.erb")
    end
  end

  def insert_like
    @the_like = Like.new
    @the_like.fan_id = session[:user_id]
    @the_like.photo_id = params.fetch("photo_id")

    @the_like.save

    redirect_to("/photos", { :notice => "Like created successfully." })
  end

  def delete_like
    @the_like = Like.where({ :fan_id => @current_user.id, :photo_id => params.fetch("photo_id") }).at(0)
    @the_like.destroy


    redirect_to("/photos", { :alert => "Like deleted successfully." })
  end


  def insert_comment
      @new_comment = Comment.new
      
      @new_comment.author_id = @current_user.id
      @new_comment.body = params.fetch("query_body")
      @new_comment.photo_id = params.fetch("query_photo_id")

      @new_comment.save
  end

  def insert_photo
    @new_photo = Photo.new
    
    @new_photo.caption = params.fetch("query_caption")
    @new_photo.comments_count = 0
    @new_photo.image = params.fetch("query_image")
    @new_photo.likes_count = 0
    @new_photo.owner_id = @current_user.id

    @new_photo.save

    redirect_to("/photos", { :notice => "Photo created successfully" })
  end
end
