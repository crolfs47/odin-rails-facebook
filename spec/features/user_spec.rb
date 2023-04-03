require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user1) { FactoryBot.create(:user, :user1)}
  let!(:user2) { FactoryBot.create(:user, :user2)}

  context 'When user is not logged in' do
    it 'requires login' do
      visit root_path
      expect(page).to have_content('Login')
    end
  end

  context 'When user is logged in' do
    it 'logs the user in' do
      login_as(user1)
      visit user_path(id: user1.id)
      expect(page).to have_content(user1.full_name)
    end
  end

  context 'When viewing another users show page' do
    it 'shows the users basic info' do
      login_as(user1)
      visit user_path(id: user2.id)
      expect(page).to have_content(user2.full_name)
      expect(page).to have_content(user2.location)
    end
  end

  context 'When updating user information' do
    it 'updates the user location' do
      login_as(user1)
      visit edit_user_path(id: user1.id)
      fill_in 'Location', with: 'New York City'
      click_on 'Update User'
      visit user_path(id: user1.id)
      expect(page).to have_content('New York City')
    end

    it 'can only update current users info' do
      login_as(user1)
      visit user_path(id: user2.id)
      expect(page).not_to have_content('Update')
    end
  end
end