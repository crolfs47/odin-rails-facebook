require 'rails_helper'

RSpec.describe 'Event', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:event) { Event.create(name: 'Test event', host: user1, location: 'Test location', date: Date.today, start_time: '19:00:00', end_time: '22:00:00' )}

  context 'When a user clicks on Create New Event' do
    before do
      login_as(user1)
      visit events_path
      click_on 'Create New Event'
    end

    it "they can't create an event without all of the required fields" do
      click_on 'Create Event'
      expect(page).to have_content("Name can't be blank")
    end

    it 'they can create a new event' do
      fill_in 'Name', with: 'New Test Event'
      fill_in 'Date', with: Date.today
      fill_in 'Start time', with: '19:00:00'
      fill_in 'End time', with: '22:00:00'
      fill_in 'Location', with: 'Test'
      click_on 'Create Event'
      expect(page).to have_content 'New Test Event'
    end
  end

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
