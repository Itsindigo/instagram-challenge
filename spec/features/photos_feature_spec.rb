require 'rails_helper'

feature 'homepage' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      user_sign_up
      visit '/photos'
      expect(page).to have_content 'Upload your first photo and start sharing'
      expect(page).to have_link 'Upload'
    end
  end

  context 'viewing photos' do
    scenario 'lets a user view a photo' do
      user_sign_up
      create_photo
      click_link "Photo name"
      expect(page).to have_content 'Photo name'
    end
  end

  context 'photos have been added' do
    scenario 'display photos' do
      user_sign_up
      create_photo
      expect(page).to have_content("Photo name")
      expect(page).not_to have_content("Upload your first photo and start sharing")
    end
  end
end



feature "user logged in elements" do
  context 'creating photos' do
    scenario 'prompts user to fill out a form then displays the photo' do
      user_sign_up
      create_photo
      expect(current_path).to eq '/photos'
    end
  end

  scenario 'a user should only be able to access their own photos' do
    user_sign_up
    create_photo
    click_link "Sign out"
    alternate_sign_up
    expect(page).not_to have_content("Photo name")
  end


  context 'editing photos' do
    scenario 'let a user edit a photo they created' do
      user_sign_up
      create_photo
      click_link "Edit Photo name"
      fill_in 'Name', with: 'new photo name'
      click_button 'Update Photo'
      expect(current_path).to eq '/photos'
      expect(page).to have_content "Edit new photo name"
    end

    scenario 'a user should not be able to a photo that they did not create' do
      user_sign_up
      create_photo
      click_link 'Sign out'
      alternate_sign_up
      expect(page).not_to have_content "Edit Photo name"
    end
  end

  context 'deleting photos' do
    scenario 'removes a photo when a user clicks a delete_link' do
      user_sign_up
      create_photo
      click_link 'Delete Photo name'
      expect(page).to have_content 'Photo successfully deleted'
    end
  end
end
