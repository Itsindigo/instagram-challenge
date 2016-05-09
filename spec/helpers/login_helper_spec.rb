require 'rails_helper'

def user_sign_up
  visit('users/sign_up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def alternate_sign_up
  visit('users/sign_up')
  fill_in('Email', with: 'anotheruser@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
