class UsersController < ApplicationController
    def new
       @user = User.new 
    end

    def index
      @user = session[:user]
      @events= Event.where(creator: session[:id])
    end
    
    def login
       @user = User.new(params)
       @current_user = User.find_by(username: @user.username)
       session[:user] = @user.username 
    end

    def create
      @user = User.new(user_params)
      respond_to do |format| 
        if @user.save
          session[:user] = @user.username
          session[:id] = @user.id
            format.html { redirect_to action: 'index', notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
        else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
     @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:name, :username)
    end
end
