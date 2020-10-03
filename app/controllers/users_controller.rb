class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = session[:user]
    @events = Event.where(creator: current_user.id)
  end

  def login
    @user = User.new(params)
    # @current_user = User.find_by(username: @user.username)
    session[:user] = @user.username
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:id] = @user.id
        current_user
        format.html { redirect_to action: 'index', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @your_events = Event.where(creator: current_user.id)
    @upcoming_events = current_user.appointments.upcoming
    @past_events = current_user.appointments.past
    @events = current_user.appointments
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
