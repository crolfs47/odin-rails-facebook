require 'rails_helper'

RSpec.describe 'Notification', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }

  context 'When a user has no unread notifications' do
    it 'shows 0 new notifications in the notification dropdown' do
      login_as(user1)
      visit notifications_path
      expect(page).to have_content ('0 New Notifications')
    end
  end

  context 'When user 1 friend requests user 2' do
    it 'user 2 gets the correct notification' do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit notifications_path
      expect(page).to have_content('1 New Notifications')
    end
  end

  context 'When user 1 likes a post that user 2 made' do
    it 'user 2 gets the correct notification' do
    end
  end

  context 'When user 1 comments on a post that user 2 made' do
    it 'user 2 gets the correct notification' do
    end
  end

  context 'When a user has one unread notification' do
    it 'shows one new notification in the notification dropdown' do
    end
  end

  context 'When a user has two unread notification' do
    it 'shows two new notification in the notification dropdown' do
    end
  end

end
