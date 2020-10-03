require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:events).with_foreign_key(:creator_id) }
    it { should have_many(:attendees).with_foreign_key(:attendee_id) }
    it { should have_many(:appointments).through(:attendees).source(:attended_event) }
  end

  describe 'validations' do
    subject { User.create(name: 'Test user', username: 'Test username') }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
  end
end
