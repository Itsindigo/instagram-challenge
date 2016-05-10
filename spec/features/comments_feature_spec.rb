require 'rails_helper'

feature 'photo comments' do
  scenario "a logged in user can view a comment prompt" do
    user_sign_up
    create_photo
    visit '/photos/1'
    expect(page).to have_content("Be the first to comment")
  end

  scenario "a logged in user can make a comment" do
    user_sign_up
    create_photo
    visit '/photos/1'
    fill_in :comment_entry, with: "A really whitty comment."
    expect(current_path).to eq('/photos/1')
  end
end
