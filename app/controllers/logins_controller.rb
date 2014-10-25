class LoginsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Successfully logged in."
    else
      redirect_to logins_new_path, notice: "User name and/or password is incorrect."
    end
  end

  def destroy
  end
end
