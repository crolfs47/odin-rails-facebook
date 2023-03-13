require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { FactoryBot.create(:user)}

  context 'When user is not logged in' do
    it 'requires login' do
      visit root_path
      expect(page).to have_content('Log in')
    end
  end

  context 'When user is logged in' do
    it 'logs the user in' do
      login_as(user)
      visit user_path(id: user.id)
      expect(page).to have_content(user.full_name)
    end
  end


  context 'When updating a user' do
    it 'updates the user location' do
      login_as(user)
      visit edit_user_path(id: user.id)
      fill_in 'Location', with: 'New York City'
      click_on 'Update User'
      visit user_path(id: user.id)
      expect(page).to have_content('New York City')
    end
  end
end