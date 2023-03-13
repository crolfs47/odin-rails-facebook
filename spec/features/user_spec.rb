require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:user) { FactoryBot.create(:user)}

  context 'When updating a user' do
    it 'updates the user location' do
      login_as(user)
      visit edit_user_path(id: user.id)
      fill_in 'Location', with: 'New York City'
      click_on 'Update User'
      visit user_path(id: user.id)
      expect(page).to have_content('New York City')
      user.destroy!
    end
  end
end