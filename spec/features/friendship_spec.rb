require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1)}
  let!(:user2) { FactoryBot.create(:user, :user2)}

  context 'When a user makes a friend request' do
    before do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
    end
    it 'cannot send a request to itself' do
      visit user_path(id: user1.id)
      expect(page).not_to have_content('Add Friend')
    end

    it 'cannot send a request to a user that is already a friend or a pending friendship' do
      expect(page).not_to have_content('Add Friend')
    end

    it 'changes status to pending friendship on the user profile' do
      expect(page).to have_content('Friendship Pending')
    end

    it 'changes status to pending friendship on the users index page' do
      visit users_path
      expect(page).to have_content("#{user2.full_name}\nFriendship Pending")
    end
  end

  context 'When a user accepts a friend request' do
    before do
      login_as(user1)
      visit users_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit users_path(user_id: user1.id)
      click_on 'Confirm Request'
    end

    it 'changes status to friends on the user profile' do
      expect(page).to have_content('Unfriend')
    end

    it 'changes status to friends on the user index page' do
      visit users_path
      expect(page).to have_content("#{user1.full_name}\nFriends")
    end

    it 'they can unfriend the user' do
      click_on 'Unfriend'
      expect(page).to have_content('Add Friend')
    end
  end

  context 'When a user has a pending friend request' do
    it 'they can cancel a pending request they sent' do
      login_as(user1)
      visit users_path(id: user2.id)
      click_on 'Add Friend'
      visit users_path(user_id: user1.id)
      click_on 'Cancel Request'
      expect(page).not_to have_content('Friendship pending')
    end

    it 'they can delete a pending request they received' do
      login_as(user1)
      visit users_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit users_path(user_id: user1.id)
      click_on 'Decline Request'
      expect(page).not_to have_content('Friendship pending')
    end
  end
end