# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Management', js: true do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_info) { FactoryBot.build(:user) }

  scenario 'should redirect to login if I am not logged in' do
    visit root_path
    expect(page).to have_current_path new_user_session_path
  end

  scenario 'should be able to login' do
    visit root_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'should be able to logout' do
    login_as user
    visit root_path
    click_link user.full_name
    click_link 'Logout'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'should edit a user' do
    login_as user

    visit edit_user_path user
    fill_in :user_first_name, with: user_info.first_name
    fill_in :user_last_name, with: user_info.last_name
    fill_in :user_email, with: user_info.email
    fill_in :user_password, with: user_info.password
    click_button 'Update User'
    expect(page).to have_content 'User was successfully updated.'
  end

  scenario 'should view the details of a user ' do
    login_as user

    visit user_path user
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email
  end
end
