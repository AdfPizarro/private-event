class SessionsController < ApplicationController
    def new
     @user= User.new 
    end

    def create

      @login_user = User.new(session_params)
     
      if User.exists?(:username => @login_user.username)
          session[:user] = @login_user.username
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
