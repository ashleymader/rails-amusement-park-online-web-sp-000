class UsersController < ApplicationController
    before_action :authenticate_user, :except => [:new, :create]

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    def show
        
        @user = User.find(session[:user_id])
        if  @user != current_user
            redirect_to new_users_path
        else 
            render :show
        end
        # binding.pry
    end


    

    private 

    def user_params
        params.require(:user).permit(:name, :password, :height, :nausea, :tickets, :admin, :happiness)
    end
end
