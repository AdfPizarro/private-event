class User < ApplicationRecord
    has_many :events, through: :attendees
    has_many :events 
end
