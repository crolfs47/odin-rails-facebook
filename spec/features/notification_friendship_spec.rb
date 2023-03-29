require 'rails_helper'

RSpec.describe 'Notification', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }

  context 'When a user has no unread notifications' do
    it 'shows 0 new notifications in the notification dropdown' do
      login_as(user1)
      visit notifications_path
      expect(page).to have_content('0 New Notifications')
    end
  end

  context 'When user 1 friend requests user 2' do
    before do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit notifications_path
    end

    it 'user 2 gets a notification' do
      expect(page).to have_content('1 New Notifications')
    end

    it 'user 2 gets the correct type of unread notification' do
      expect(page).to have_content("Unread\n#{user1.full_name}\nsent you a\nfriend request")
    end

    it 'switches to read when user 2 clicks on the notification link' do
      click_on 'friend request'
      visit notifications_path
      expect(page).not_to have_content("Unread\n#{user1.full_name}\nsent you a\nfriend request")
      expect(page).to have_content("Read\n#{user1.full_name}\nsent you a\nfriend request")
    end
  end

end
