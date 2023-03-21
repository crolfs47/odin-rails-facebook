require 'rails_helper'

RSpec.describe 'Like', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }

  context 'When a user likes a post' do
    before do
      login_as(user1)
      visit root_path
      fill_in 'post_content', with: 'Test post'
      click_on 'Post'
      click_on 'Like'
    end

    it 'they cannot like it again' do
      expect(page).to have_content('Unlike')
    end

    it "shows the post has one like on the user's post index page" do
      expect(page).to have_content('Likes: 1')
    end

    it "shows the post has one like on the user's friend's post index page" do
      visit user_path(id: user2.id)
      click_on 'Add Friend'
      click_on 'Logout'

      login_as(user2)
      visit user_friendships_path(user_id: user1.id)
      click_on 'Confirm Request'
      visit root_path
      expect(page).to have_content('Likes: 1')
    end

    it 'the user can unlike the post they liked' do
      click_on 'Unlike'
      expect(page).not_to have_content('Unlike')
      expect(page).to have_content('Likes: 0')
    end
  end
end
