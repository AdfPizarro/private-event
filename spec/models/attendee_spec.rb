# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'associations' do
    it { should belong_to(:attendee).class_name(User.name) }
    it { should belong_to(:attended_event).class_name(Event.name) }
  end
end
