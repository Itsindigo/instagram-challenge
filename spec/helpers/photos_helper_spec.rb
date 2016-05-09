require 'rails_helper'

def create_photo
  visit '/'
  click_link 'Upload'
  fill_in 'Name', with: 'Photo name'
  # attach_file 'photo[image]', Rails.root.join('spec','images','bbc-g.jpg')
  click_button 'Create Photo'
end
