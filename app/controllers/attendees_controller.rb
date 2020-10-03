# frozen_string_literal: true

class AttendeesController < ApplicationController
  def create
    @attendee = current_user.attendees.build
    @attendee.attended_event_id = params[:event_id]

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to event_path(@attendee.attended_event_id), notice: 'Attendee confirmed' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end
end
