# frozen_string_literal: true

class UpdateAttendeeColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendees, :attendee, :attendee_id
    rename_column :attendees, :attended_event, :attended_event_id
  end
end
