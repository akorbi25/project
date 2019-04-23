class SessionsController < ApplicationController
  def new
    
  end
  
  # def show
  #   if current_user.role == 'admin'
  #       render 'show_admin'
  #   else
  #     render 'show'
  #   end
  # end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if (current_user.role? :employee or current_user.role? :manager)
        redirect_to employees_path, notice: "Logged in!"
      else (current_user.role? :admin )
        redirect_to home_path, notice: "Logged in!"
      end
      
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end