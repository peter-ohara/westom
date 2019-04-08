# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Contact Management', js: true do
  let!(:user) { FactoryBot.create(:user) }

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
end
