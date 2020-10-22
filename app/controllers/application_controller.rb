class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user
  
  
  private 

  def logged_in?
    !!current_user
  end
  #boolean for if user is logged in. Hard truthy or falsey value 



  # tracks user across site 
  def current_user
    @user ||= User.find_by(id: session[:user_id])
    # binding.pry
    #limits calls to db by checking to see if @user has a value first and then will query db. 
  end


  #if user isn't logged in, redirect to home page. 
  def authenticate_user
    if !logged_in?        
      redirect_to root_path
    end
  end

end

