require 'rails_helper'

RSpec.describe 'Like', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }

  context 'When a user makes a post' do
    before do
      login_as(user1)
      visit root_path
      fill_in 'post_content', with: 'Test post'
      click_on 'Post'
    end

    it "the post appears on the user's post index page" do
      expect(page).to have_content('New post created.')
      expect(page).to have_content('Test post')
    end

    it "the post appears on the user's friends post index page" do
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      visit root_path
      expect(page).to have_content('Test post')
    end

    it 'the post doesnt appear on users that arent friends with user 1' do
      login_as(user2)
      visit root_path
      expect(page).not_to have_content('Test post')
    end

    it 'they can delete the post they made' do
      click_on 'Delete Post'
      expect(page).to have_content('Post successfully deleted.')
    end

    it "another user cannot delete their post" do
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      visit root_path
      expect(page).to have_content('Test post')
      expect(page).not_to have_content('Delete post')
    end

    it 'they can edit the post they made' do
      click_on 'Edit Post'
      fill_in 'post_content', with: 'Test post edited'
      click_on 'Update Post'
      expect(page).to have_content('Test post edited')
    end

    it 'another user cannot edit their post' do
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      visit root_path
      expect(page).not_to have_content('Edit Post')
    end
  end

  context 'When a user makes a post with no content' do
    it 'flashes an error message' do
      login_as(user1)
      visit root_path
      click_on 'Post'
      expect(page).to have_content('Error:')
    end
  end
end
