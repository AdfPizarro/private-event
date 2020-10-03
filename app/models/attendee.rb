class Attendee < ApplicationRecord
  belongs_to :attendee, class_name: User.name
  belongs_to :attended_event, class_name: Event.name

  validates :attendee_id, :attended_event_id, presence: true
end
