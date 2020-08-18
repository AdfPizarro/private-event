class User < ApplicationRecord
    has_many :events, foreign_key: :creator
   # has_many :events, through: :attendees 
    has_many :attendees
end
