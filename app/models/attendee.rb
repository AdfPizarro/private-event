class Attendee < ApplicationRecord
  belongs_to :attendee, class_name: User.name
  belongs_to :attended_event, class_name: Event.name
end
