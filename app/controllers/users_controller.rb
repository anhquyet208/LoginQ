class UsersController < ApplicationController 
    before_action :authorize

    def new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            flash[:success]=t".success"
            redirect_to edit_user_path(@user)
        else
            render :new
        end
    end

    def edit 
        @user = User.find_by(id: params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
