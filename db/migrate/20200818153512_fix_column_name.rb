# frozen_string_literal: true

class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendees, :user_id, :attendee
    rename_column :attendees, :event_id, :attended_event
  end
end
