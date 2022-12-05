Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })
  
  get("/users", { :controller => "user", :action => "index" })
  get("/users/:username", { :controller => "user", :action => "profile" })
  get("/users/:username/feed", { :controller => "user", :action => "profile_feed" })


  get("/photos", { :controller => "photo", :action => "index" })
  get("/photos/:photo_id", { :controller => "photo", :action => "photo_page" })
  post("/insert_like/:photo_id", { :controller => "photo", :action => "insert_like" })
  get("/delete_like/:photo_id", { :controller => "photo", :action => "delete_like" })
  post("/insert_photo", { :controller => "photo", :action => "insert_photo" })


  post("/follow", { :controller => "user", :action => "follow" })
  post("/unfollow", { :controller => "user", :action => "unfollow" })

  post("/insert_comment", { :controller => "photo", :action => "insert_comment" })



  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })     
    
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
