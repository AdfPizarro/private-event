class Event < ApplicationRecord
    has_many :attendees, class_name: User.name, through: :attendees
    #has_many :users, through: :attendees
    belongs_to :creator,  class_name: User.name
end
