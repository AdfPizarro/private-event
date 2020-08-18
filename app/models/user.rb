class User < ApplicationRecord
     has_many :events, foreign_key: :creator
     has_many :attendees, foreign_key: :attendee_id
#    has_many :appointments, class_name Event.name,  foreign_key: : 
     has_many :appointments, through: :attendees, source: :attended_event
end
