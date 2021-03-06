class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:alert] = 'Failed to login'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_user_path
  end
end
