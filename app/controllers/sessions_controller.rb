class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token


  def new
  end

 def create
    @user = User.find_by_email(params[:session][:email])
    

    if @user && @user.authenticate(params[:session][:password])
      #puts 'autenticado'
      session[:user_id] = @user.id
      redirect_to root_path
      #render :inline => "<%= session %>"
    else
      redirect_to login_path
      #render :inline => "No jalo jajaja"
      #puts 'no jajaj'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/' 
  end
end
