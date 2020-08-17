class Event < ApplicationRecord
    has_many :users, through: :attendees
    belongs_to :user
end
