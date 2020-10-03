# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendees, foreign_key: :attendee_id
  has_many :appointments, through: :attendees, source: :attended_event

  validates :name, :username, presence: true
end
