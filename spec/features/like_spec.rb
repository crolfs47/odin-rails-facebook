require 'rails_helper'

RSpec.describe 'Like', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:friendship) { Friendship.create(user: user1, friend: user2, accepted: true) }
  let!(:post) { Post.create(user: user1, content: 'Test post') }

  context 'When a user likes a post' do
    before do
      login_as(user1)
      visit root_path
      click_link('like')
    end

    it "shows the post has one like on the user's post index page" do
      expect(page).to have_content('1')
    end

    it "shows the post has one like on the user's friend's post index page" do
      login_as(user2)
      visit root_path
      expect(page).to have_content('1')
    end

    it 'shows two likes when another user likes the post' do
      login_as(user2)
      visit root_path
      click_link('like')
      expect(page).to have_content('2')
    end

    it 'the user can unlike the post they liked' do
      click_link('unlike')
      expect(page).to have_content('0')
    end
  end
end
