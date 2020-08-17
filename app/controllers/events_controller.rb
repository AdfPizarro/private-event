class EventsController < ApplicationController
 def new
       @event = Event.new
    end

def create
      @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
            format.html { redirect_to action: 'index', notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @event }
        else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end


private

    def event_params
      params.require(:event).permit(:name, :username)
    end
end
