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
      if (user.emp_role == "employee")
        redirect_to home_path 
      elsif (user.emp_role == "manager")
        redirect_to home_path 
      elsif (user.emp_role == "admin" )
        redirect_to home_path 
      else
        flash.now[:alert] = "Email or password is invalid"
        render "login"
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
end