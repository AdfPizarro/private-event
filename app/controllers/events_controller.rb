class EventsController < ApplicationController
 before_action :authorize
 
 def index
  @events=Event.all
 end
 def new
       user=User.find(session[:id])
       @event= user.events.build
  end

  def show
    @event = Event.find(params[:id])
       
  end

def create
     user=User.find(session[:id])
      @event= user.events.build(event_params)
     # @event = Event.new(event_params)
      #@event.user_id=session[:id]
      respond_to do |format|
        if @event.save
            format.html { redirect_to '/users', notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @event }
        else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end


private

    def event_params
      params.require(:event).permit(:name, :location, :date, :description)
    end

    def authorize
    redirect_to '/sessions/new' unless session[:id]
  end
end
