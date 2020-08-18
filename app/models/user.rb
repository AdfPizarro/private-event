class User < ApplicationRecord
    has_many :events, foreign_key: :creator
   # has_many :appointments, through: :attendees, foreign_key: :creator_id 
    has_many :appointments, through: :attendees
end
