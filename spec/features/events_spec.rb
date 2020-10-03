require 'rails_helper'
require './spec/features/authentication_helper.rb'

RSpec.describe 'Show events', type: :feature do
  include AuthenticationHelper
  let!(:user) { User.create username:'test_username', name: 'test_user' }
  let(:event) do
    Event.create({
                   name: 'Event name',
                   description: 'Some text',
                   location: 'Somewhere',
                   date: Date.current,
                   creator_id: user.id
                 })
  end

  scenario 'Should display event details' do
    login_user
    visit event_path(event.id)
    expect(page).to have_content(event.location)
    expect(page).to have_content(event.description)
    expect(page).to have_content(event.date)
    expect(page).to have_content(event.name)
    expect(page).to have_content('Attendees')
  end

  scenario 'Should create an event and display it' do
    login_user
    event.name='Event name'
    visit new_event_path
    fill_in 'event[name]', with: event.name
    fill_in 'event[location]', with: 'Somewhere'
    fill_in 'event[description]', with: 'Some text'
    fill_in 'event[date]', with: Date.current
    click_button 'Create Event'
    expect(page).to have_content(event.name)
  end

  scenario 'Should attend to an event and display it' do
    login_user
    visit event_path(event.id)
    click_button "I'll be there"
    expect(page).to have_content('You are already register for this event')
  end
end
