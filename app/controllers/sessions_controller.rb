class SessionsController < ApplicationController
    def new
     @user = User.new 
    end

    def create
      @user = User.new(user_params)
        respond_to do |format| 
          if @user.save
            session[:user] = @user.username 
              format.html { redirect_to action: 'index', notice: 'User was successfully created.' }
              format.json { render :show, status: :created, location: @user }
          else
              format.html { render :new }
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    def
end
