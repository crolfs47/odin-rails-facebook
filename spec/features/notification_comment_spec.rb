require 'rails_helper'

RSpec.describe 'Notification', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1) }
  let!(:user2) { FactoryBot.create(:user, :user2) }
  let!(:friendship) { Friendship.create(user: user1, friend: user2, accepted: true) }
  let!(:post) { Post.create(user: user2, content: 'User 2 test post') }

  context 'When user 1 comments on a post that user 2 made' do
    before do
      
    end
    
    it 'user 2 gets a notification' do
      
    end

    it 'user 2 gets the correct type of unread notification' do
    
    end

    it 'switches to read when user 2 clicks on the notification link' do
      
    end
  end
end