# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authorize

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past

    @events = Event.find_by_sql('SELECT "events".* FROM "events" INNER JOIN "attendees" ON "events"."id" =
                                "attendees"."attended_event_id" WHERE NOT "attendees"."attendee_id" = ' + current_user.id.to_s)
    @appointments = current_user.appointments
  end

  def new
    @event = current_user.events.build
   end

  def show
    @event = Event.find(params[:id])
  end

  def appointment; end

  def cancel; end

  def create
    user = User.find(session[:id])
    @event = user.events.build(event_params)
    # @event = Event.new(event_params)
    # @event.user_id=session[:id]
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
end
