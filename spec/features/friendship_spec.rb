require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1)}
  let!(:user2) { FactoryBot.create(:user, :user2)}

  context 'When a user makes a friend request' do
    it 'cannot send a request to itself' do
      login_as(user1)
      visit user_path(id: user1.id)
      expect(page).not_to have_content('Add Friend')
    end

    it 'cannot send a request to a user that is already a friend or a pending friendship' do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      expect(page).not_to have_content('Add Friend')
    end

    it 'changes status to pending friendship' do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      expect(page).to have_content('Friendship Pending')
    end
  end

  context 'When a user accepts a friend request' do
    it 'changes status to friends' do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      expect(page).to have_content('Friendship Confirmed')
    end
  end

  context 'When a user has a pending friend request' do
    it 'they can cancel a pending request they sent' do
      login_as(user1)
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      visit user_friendships_path(user_id: user1.id)
      click_on 'Cancel Request'
      expect(page).not_to have_content(user2.full_name)
    end

    it 'they can delete a pending request they received' do
      
    end
  end
end