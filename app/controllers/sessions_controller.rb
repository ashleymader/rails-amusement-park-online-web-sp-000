class SessionsController < ApplicationController

    def home

    end
  
    #render my login form for a user 
    def new
      @user = User.new
      @users = User.all
    end
  
    #recieving params from sessions/new.erb
    def create
      @user = User.find_by(id: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to(signin_path)
      end
    end    

end
