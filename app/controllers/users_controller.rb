class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:edit, :destroy, :update]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "You have successfully signed up!"
            redirect_to root_path
        else
            render :new
        end
    end

    def checkout
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        redirect_to edit_path(@user)
    end

    def profile
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to root_path
        else
            render :edit
        end
    end

private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :image, :password, :password_confirmation)
    end

    def set_user
        @user = User.find(params[:id])
    end
end