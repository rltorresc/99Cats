class SessionsController < ApplicationController
    before_action :logged_in?, only: [:new, :create]
    def new
        render :new
    end
    def create 
        @user = User.find_by_credentials(user_params[:user_name], user_params[:password])
        if @user
            session_token = @user.generate_session_token
            device = device_info
            location = location
            Session.create(user_id: @user.id, session_token: session_token, device: device, location: location)
            session[:session_token] = session_token
            redirect_to cats_url
        else
            flash[:alert] = "Invalid username or password"
            redirect_to new_session_url
        end
        
    end
    def destroy
        if current_user
            Session.find_by(user_id: current_user.id, session_token: session[:session_token]).destroy
        end
        redirect_to cat_url
    end
    def destroy_remote
        session = Session.find(params[:session_id])
        if session.user == current_user
            session.destroy
            if current_user
                redirect_to user_path(current_user)
            else
                redirect_to new_session_url
            end
        end
    end

    def current_user=(user)
        @current_user = user
    end
    
    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end

end