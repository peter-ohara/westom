# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Contact Management', js: true do
  let!(:contact) { FactoryBot.build(:contact) }
  let!(:existing_contact) { FactoryBot.create(:contact) }

  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:deal) do
    FactoryBot.create(:deal, contact: existing_contact, broker: user)
  end

  before :each do
    login_as user
  end

  scenario 'should add a contact (lead or client)' do
    visit contacts_path
    click_link 'Add New Contact'
    fill_out_contact_information(contact)
    click_button 'Create Contact'
    expect(page).to have_content 'Contact was successfully created.'
  end

  scenario 'should edit a contact (lead or client)' do
    visit edit_contact_path existing_contact
    fill_out_contact_information(contact)
    click_button 'Update Contact'
    expect(page).to have_content 'Contact was successfully updated.'
  end

  scenario 'should be able to assign myself or another user as ' \
           'the broker for a deal' do
    visit edit_deal_path deal
    select user2.full_name, from: :deal_user_id
    click_button 'Update Deal'
    expect(page).to have_content 'Deal was successfully updated.'
    expect(page).to have_content user2.full_name
  end

  scenario 'should delete a contact (lead or client)' do
    skip 'Need to implement soft deletes then dependent destroy or some other strategy'
    visit contact_path existing_contact

    page.accept_confirm do
      click_link 'DELETE'
    end

    expect(page).to have_content 'Contact was successfully deleted.'
  end

  scenario 'should view the details of a contact ' do
    visit contact_path existing_contact
    expect_page_to_have_contact_information(page, existing_contact)
  end

  scenario 'should be able to view all clients that have been assigned to ' \
           'another user as their broker' do
    visit user_path user
    within :css, '#contacts' do
      expect(page).to have_content existing_contact.full_name
      expect(page).to have_link, href: contact_path(existing_contact)
    end
  end
end

def fill_out_contact_information(contact)
  fill_in :contact_first_name, with: contact.first_name
  fill_in :contact_last_name, with: contact.last_name
  fill_in :contact_mobile, with: contact.mobile
  fill_in :contact_email, with: contact.email

  select contact.date_of_birth.strftime('%Y'), from: 'contact_date_of_birth_1i'
  select contact.date_of_birth.strftime('%B'), from: 'contact_date_of_birth_2i'
  select contact.date_of_birth.strftime('%-d'), from: 'contact_date_of_birth_3i'

  fill_in :contact_present_address, with: contact.present_address
  fill_in :contact_notes, with: contact.notes
end

def expect_page_to_have_contact_information(page, existing_contact)
  expect(page).to have_content existing_contact.first_name
  expect(page).to have_content existing_contact.last_name
  expect(page).to have_content existing_contact.mobile
  expect(page).to have_content existing_contact.email
  expect(page).to have_content existing_contact.date_of_birth.strftime('%Y')
  expect(page).to have_content existing_contact.date_of_birth.strftime('%B')
  expect(page).to have_content existing_contact.date_of_birth.strftime('%-d')
  expect(page).to have_content existing_contact.present_address
  expect(page).to have_content existing_contact.notes
end
