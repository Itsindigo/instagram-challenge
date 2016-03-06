require 'rails_helper'

feature 'homepage' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/photos'
      expect(page).to have_content 'Upload your first photo and start sharing'
      expect(page).to have_link 'Upload'
    end
  end
end
