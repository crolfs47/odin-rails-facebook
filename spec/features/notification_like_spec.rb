require 'rails_helper'

RSpec.describe 'Notification', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:friendship) { Friendship.create(user: user1, friend: user2, accepted: true) }
  let!(:post) { Post.create(user: user2, content: 'User 2 test post') }

  context 'When user 1 likes a post that user 2 made' do
    before do
      login_as(user1)
      visit root_path
      click_link('like')
      click_on 'Logout'
      login_as(user2)
      visit notifications_path
    end

    it 'user 2 gets a notification' do
      expect(page).to have_content('1 New Notifications')
    end

    it 'user 2 gets the correct type of unread notification' do
      expect(page).to have_content("Unread\n#{user1.full_name}\nliked your\npost")
    end

    it 'switches to read when user 2 clicks on the notification link' do
      click_on 'post'
      visit notifications_path
      expect(page).not_to have_content("Unread\n#{user1.full_name}\nliked your\npost")
      expect(page).to have_content("Read\n#{user1.full_name}\nliked your\npost")
    end
  end

end
