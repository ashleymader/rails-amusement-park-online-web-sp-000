class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized_to_view, :authentication_required

  private 
  #boolean for if user is logged in. Hard truthy or falsey value 
  def logged_in?
    !!current_user
  end

  # tracks use across site 
  def current_user
    User.find_by(id: session[:user_id])
    # binding.pry
    #limits calls to db by checking to see if @user has a value first and then will query db. 
  end

  # create an authorization helper for viewing profiles

  # def authorized_to_view
  #     id.to_i == current_user.id 
  # end

  def authentication_required
    if !logged_in?        
      redirect_to root_path
    end
  end

end

