require 'rails_helper'

RSpec.describe 'Comment', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:friendship) { Friendship.create(user: user1, friend: user2, accepted: true) }
  let!(:post) { Post.create(user: user1, content: 'User 1 test post') }
  let!(:comment) { Comment.create(post: post, user: user2, content: 'User 2 test comment')}

  context 'When a user comments on a post' do
    it 'displays the new comment' do
      login_as(user1)
      visit root_path
      expect(page).to have_content('User 2 test comment')
    end

    it 'does not allow a blank comment' do
      
    end
  end
end