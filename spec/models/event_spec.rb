# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name(User.name) }
    it { should have_many(:attendees).with_foreign_key(:attended_event_id) }
    it { should have_many(:invitees).through(:attendees).source(:attendee) }
  end

  describe 'validations' do
    subject do
      Event.create({
                     name: 'A random user',
                     location: 'foobar',
                     description: 'lorem ipsum dolor sit amet',
                     date: Date.tomorrow,
                     creator_id: 1
                   })
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
  end
end
