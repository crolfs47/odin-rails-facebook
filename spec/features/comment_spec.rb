require 'rails_helper'

RSpec.describe 'Comment', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }

  context 'When a user comments on a post' do
    before do
      login_as(user1)
      visit root_path
      fill_in 'post_content', with: 'User 1 test post'
      click_on 'Post'
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      visit root_path
      click_on 'Logout'
    end

    it 'they can comment on one of their own posts' do
      login_as(user1)
      visit root_path
      expect(page).to have_content('Add Comment')
      # fill_in 'Write a comment...', with: 'User 1 test comment'
      # click_on 'Add comment'
      # expect(page).to have_content('New comment created.')
    end

    it "they can comment on another user's post" do
    
    end

    it 'they cannot submit a blank comment' do
      
    end
  end
end