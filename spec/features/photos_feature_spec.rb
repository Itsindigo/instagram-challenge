require 'rails_helper'

feature 'homepage' do

  before do
    user_sign_up
  end

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'Upload your first photo and start sharing'
      expect(page).to have_link 'Upload'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(name: "Holiday Picture")
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content("Holiday Picture")
      expect(page).not_to have_content("Upload your first photo and start sharing")
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form then displays the photo' do
      visit '/photos'
      click_link 'Upload'
      fill_in 'Name', with: "Holiday Picture"
      click_button 'Create Photo'
      expect(page).to have_content 'Holiday Picture'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing photos' do

    let!(:london){Photo.create(name:'London')}

    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'London'
      expect(page).to have_content 'London'
      expect(current_path).to eq "/photos/#{london.id}"
    end

    scenario 'a user should only be able to access their own photos' do
      visit '/photos/new'
      fill_in "Name", with: "belongs to 'test@example.com' "
      click_button "Create Photo"
      click_link 'Sign out'
      alternate_sign_up
      expect(page).not_to have_content("belongs to 'test@example.com'")
    end
  end

  context 'editing photos' do
    before {Photo.create name: 'London'}

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Edit London'
      fill_in 'Name', with: 'London 2016'
      fill_in 'Description', with: 'Nice holiday'
      click_button 'Update Photo'
      expect(page).to have_content('London 2016')
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    before {Photo.create name: "ooh ah malia"}

    scenario 'removes a photo when a user clicks a delete_link' do
      visit '/photos'
      click_link 'Delete ooh ah malia'
      expect(page).not_to have_content 'ooh ah malia'
      expect(page).to have_content 'Photo successfully deleted'
    end
  end
end
