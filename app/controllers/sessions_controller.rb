class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def destroy
    session[:id] = nil
    respond_to do |format|
      format.html { redirect_to '/sessions/new', notice: 'Login succesfully' }
    end
  end

  def create
    @login_user = User.new(session_params)

    if User.exists?(username: @login_user.username)
      usr = User.where(username: @login_user.username).limit(1).pluck

      session[:id] = usr[0][0]
      current_user
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Login succesfully' }
      end
    else
      respond_to do |format|
        format.html { render :new }
      end

    end
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
