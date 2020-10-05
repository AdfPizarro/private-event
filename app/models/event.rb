class Event < ApplicationRecord
  has_many :attendees, foreign_key: :attended_event_id
  has_many :invitees, through: :attendees, source: :attendee

  belongs_to :creator, class_name: User.name

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date >= ?', Time.now) }

  validates :date, :description, :name, :location, presence: true
end
