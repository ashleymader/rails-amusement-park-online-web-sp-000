class UsersController < ApplicationController
    

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        # current_user 
        # binding.pry
        @user = User.find_by_id(params[:id])
        binding.pry
        if  @user == current_user
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end
        # binding.pry
    end


    

    private 

    def user_params
        params.require(:user).permit(:name, :password, :height, :nausea, :tickets, :admin, :happiness)
    end
end
