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
      if (user.emp_role == "Employee")
        render "about" , notice: "Logged in!"
      elsif (user.emp_role == "Manager")
        redirect_to employee_path , notice: "Logged in!"
      elsif (user.emp_role == "Admin" )
        redirect_to home_path , notice: "Logged in!"
      else
        redirect_to home_path , notice: "Logged in!"
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