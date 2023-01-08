require 'useragent'
require 'geocoder'
class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
end

def current_user
    return nil unless session[:session_token]
    @current_user ||= Session.find_by(session_token: session[:session_token]).try(:user)
end
def login!(user)
    session_token = user.generate_session_token
    Session.create(user_id: user.id, session_token: session_token)
    session[:session_token] = session_token
end

def logged_in?
    redirect_to cats_url if current_user
end

def set_current_user
    @current_user = current_user
end

def check_owner
    @cat = Cat.find(params[:id])
    
    unless @cat.user_id == current_user.id 
        redirect_to cat_url(@cat), flash: { alert:  "You are not the owner of this cat" }
    end
end

def logged?
    redirect_to new_session_url unless current_user
end


def device_info
    user_agent = UserAgent.parse(request.env["HTTP_USER_AGENT"])
    @device_info = user_agent.platform  + " - " + user_agent.browser
end

def location
    location = Geocoder.search(request.remote_ip).first
    @location = location.city
end
