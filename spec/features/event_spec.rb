require 'rails_helper'

RSpec.describe 'Event', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:event) { Event.create(name: 'Test event', host: user1, location: 'Test location', date: Date.today, start_time: '19:00:00', end_time: '22:00:00' )}

  context 'When a user creates an event' do
    before do
      login_as(user1)
      visit events_path
    end

    it 'the event appears on the events index page' do
      expect(page).to have_content('Test event')
    end

    it 'the user can delete the event they made' do
      visit event_path(id: event.id)
      click_on 'Delete Your Event'
      expect(page).to have_content('Event deleted.')
    end

    it 'another user cannot delete their event' do
      click_on 'Logout'
      login_as(user2)
      visit event_path(id: event.id)
      expect(page).not_to have_content('Delete Your Event')
    end
  end
end
