class SessionsController < ApplicationController
    
    
    def index
        redirect_to new_session_path
    end

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            # successful login
            session[:user_id] = user.id
            # may want to redirect somewhere else ..... DEVELOPMENT
            redirect_to root_path, notice: 'Logged in!'
        else
            flash.now.alert = 'Invalid login - try again!'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out!'
    end

end