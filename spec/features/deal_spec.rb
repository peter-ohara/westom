# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Deal Management', js: true do
  let!(:contact) { FactoryBot.create(:contact) }
  let!(:property) { FactoryBot.create(:property) }
  let!(:deal) { FactoryBot.build(:deal) }
  let!(:existing_deal) do
    FactoryBot.create(:deal, contact: contact, property: property)
  end

  let!(:user) { FactoryBot.create(:user) }
  before :each do
    login_as user
  end

  scenario 'should add a deal to a property' do
    visit property_path property
    click_link 'Add New Deal'
    fill_out_deal_information(deal, contact)
    click_button 'Create Deal'
    expect(page).to have_content 'Deal was successfully created.'
  end

  scenario 'should edit a deal (lead or client)' do
    visit edit_deal_path existing_deal
    fill_out_deal_information(deal, contact)
    click_button 'Update Deal'
    expect(page).to have_content 'Deal was successfully updated.'
  end

  scenario 'should delete a deal (lead or client)' do
    visit deal_path existing_deal

    page.accept_confirm do
      click_link 'DELETE'
    end

    expect(page).to have_content 'Deal was successfully deleted.'
  end

  scenario 'should view the details of a deal ' do
    visit deal_path existing_deal
    expect_page_to_have_deal_information(page, existing_deal)
  end

  scenario 'should be able to change the client engaged in a deal' do
    visit edit_deal_path existing_deal
    select contact.full_name, from: :deal_contact_id
    click_button 'Update Deal'
    expect(page).to have_content 'Deal was successfully updated.'
    expect(page).to have_content contact.full_name
  end

  scenario 'should be able to view all deals that a contact ' \
           'has been involved in' do
    visit contact_path contact
    within :css, '#deals' do
      expect(page).to have_content existing_deal.name
      expect(page).to have_content existing_deal.stage.titleize
      expect(page).to have_content existing_deal.property.full_name

      expect(page).to have_content(
        ApplicationController.helpers.humanized_money_with_symbol(existing_deal.amount)
      )

      expect(page).to have_content(
        ApplicationController.helpers.time_ago_in_words(existing_deal.deadline)
      )

      expect(page).to have_link, href: deal_path(existing_deal)
    end
  end

  scenario 'should be able to view all deals that a property ' \
           'has been involved in' do
    visit property_path property
    within :css, '#deals' do
      expect(page).to have_content existing_deal.name
      expect(page).to have_content existing_deal.stage.titleize
      expect(page).to have_content existing_deal.contact.full_name

      expect(page).to have_content(
                          ApplicationController.helpers.humanized_money_with_symbol(existing_deal.amount)
                      )

      expect(page).to have_content(
                          ApplicationController.helpers.time_ago_in_words(existing_deal.deadline)
                      )

      expect(page).to have_link, href: deal_path(existing_deal)
    end
  end
end

def fill_out_deal_information(deal, contact)
  select contact.full_name, from: :deal_contact_id

  select deal.type_of_service.titleize, from: :deal_type_of_service

  select deal.request_date.strftime('%Y'), from: 'deal_request_date_1i'
  select deal.request_date.strftime('%B'), from: 'deal_request_date_2i'
  select deal.request_date.strftime('%-d'), from: 'deal_request_date_3i'

  fill_in :deal_request_details, with: deal.request_details

  fill_in :deal_amount, with: deal.amount

  select deal.deadline.strftime('%Y'), from: 'deal_deadline_1i'
  select deal.deadline.strftime('%B'), from: 'deal_deadline_2i'
  select deal.deadline.strftime('%-d'), from: 'deal_deadline_3i'

  select deal.stage.titleize, from: :deal_stage

  select deal.expiration_date.strftime('%Y'), from: 'deal_expiration_date_1i'
  select deal.expiration_date.strftime('%B'), from: 'deal_expiration_date_2i'
  select deal.expiration_date.strftime('%-d'), from: 'deal_expiration_date_3i'
end

def expect_page_to_have_deal_information(page, existing_deal)
  expect(page).to have_content existing_deal.deal_number
  expect(page).to have_content existing_deal.contact.full_name
  expect(page).to have_content existing_deal.property.full_name
  expect(page).to have_content existing_deal.type_of_service.titleize

  expect(page).to have_content existing_deal.request_date.to_formatted_s(:long)

  expect(page).to have_content existing_deal.request_details
  expect(page).to have_content(
    ApplicationController.helpers.humanized_money_with_symbol(existing_deal.amount)
  )

  expect(page).to have_content existing_deal.deadline.to_formatted_s(:long)
  expect(page).to have_content existing_deal.stage.titleize

  expect(page).to have_content existing_deal.expiration_date.to_formatted_s(:long)
end
