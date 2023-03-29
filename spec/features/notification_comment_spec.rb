require 'rails_helper'

# I can't figure out how to get the comment form to appear using rspec, need to revisit in order to test comment notifications

RSpec.describe 'Notification', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:friendship) { Friendship.create(user: user1, friend: user2, accepted: true) }
  let!(:post) { Post.create(user: user2, content: 'User 2 test post') }
  let!(:comment) { Comment.create(post: post, user: user2, content: 'User 2 test comment')}

  context 'When user 1 comments on a post that user 2 made' do
    before do
      # login_as(user1)
      # visit root_path
    end

    it 'user 2 gets a notification' do
      # expect(page).to have_content('Add comment')
    end

    it 'user 2 gets the correct type of unread notification' do
    
    end

    it 'switches to read when user 2 clicks on the notification link' do
      
    end
  end
end