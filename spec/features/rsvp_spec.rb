require 'rails_helper'

RSpec.describe 'Rsvp', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:event) { Event.create(name: 'Test event', host: user1, location: 'Test location', date: Date.today, start_time: '19:00:00', end_time: '22:00:00' )}
  let!(:rsvp) { Rsvp.create(attendee_id: user1.id, event_id: event.id)}

  context 'When a user creates an event' do
    before do
      login_as(user1)
      visit event_path(event)

    end
    it 'the user is shown as attending the event' do
      expect(page).to have_content("People Attending:\n#{user1.full_name}")
    end

    it 'another user can rsvp to attend the event' do
      click_on 'Logout'
      login_as(user2)
      visit event_path(event)
      click_on 'Attend This Event'
      expect(page).to have_content(user2.full_name)
    end

    it 'attendees can remove their rsvp' do
      click_on 'No Longer Attending Event'
      expect(page).to have_content("You're no longer attending this event")
    end
  end
end