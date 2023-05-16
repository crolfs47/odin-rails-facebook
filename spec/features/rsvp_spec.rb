require 'rails_helper'

RSpec.describe 'Rsvp', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  # let!(:event) { Event.create(name: 'Test event', host: user1, location: 'Test location', date: Date.today, start_time: '19:00:00', end_time: '22:00:00' )}

  context 'When a user creates an event' do
    before do
      login_as(user1)
      visit events_path
      click_on 'Create New Event'
      fill_in 'Name', with: 'Test Event'
      fill_in 'Date', with: Date.today
      fill_in 'Start time', with: '19:00:00'
      fill_in 'End time', with: '22:00:00'
      fill_in 'Location', with: 'Test'
      click_on 'Create Event'
    end

    it 'the user is shown as attending the event' do
      expect(page).to have_content("People Attending:\n#{user1.full_name}")
    end

    it 'another user can rsvp to attend the event' do
      click_on 'Logout'
      login_as(user2)
      visit events_path
      click_on 'Test Event'
      click_on 'Attend This Event'
      expect(page).to have_content(user2.full_name)
    end

    it 'attendees can remove their rsvp' do
      click_on 'No Longer Attending Event'
      expect(page).to have_content("You're no longer attending this event")
    end
  end
end