class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    helper_method :current_user

    def require_user
        redirect_to '/login' unless current_user
    end

    def require_author
        redirect_to '/login' unless current_user
    end

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
end
