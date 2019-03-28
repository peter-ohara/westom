# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Contact Management', js: true do
  let!(:user) { FactoryBot.create(:user) }
  let!(:contact) { FactoryBot.build(:contact) }
  let!(:existing_contact) { FactoryBot.create(:contact) }

  scenario 'should add a contact (lead or client)' do
    visit contacts_path
    click_link 'New Contact'

    fill_in :contact_full_name, with: contact.full_name

    select contact.date_of_birth.strftime('%Y'), from: 'contact_date_of_birth_1i'
    select contact.date_of_birth.strftime('%B'), from: 'contact_date_of_birth_2i'
    select contact.date_of_birth.strftime('%-d'), from: 'contact_date_of_birth_3i'

    fill_in :contact_present_address, with: contact.present_address
    fill_in :contact_community, with: contact.community
    fill_in :contact_length_of_stay_at_present_address, with: contact.length_of_stay_at_present_address
    fill_in :contact_mobile, with: contact.mobile
    fill_in :contact_occupation, with: contact.occupation
    fill_in :contact_email, with: contact.email

    check :contact_personal_property
    check :contact_jointly_owned_property
    check :contact_agent
    check :contact_has_authority_from_owner
    check :contact_has_site_plan
    check :contact_site_plan_request
    check :contact_search_report
    check :contact_search_report_request
    check :contact_valuation_report
    check :contact_valuation_report_request

    fill_in :contact_type_of_service, with: contact.type_of_service
    fill_in :contact_request_details, with: contact.request_details

    select contact.request_date.strftime('%Y'), from: 'contact_request_date_1i'
    select contact.request_date.strftime('%B'), from: 'contact_request_date_2i'
    select contact.request_date.strftime('%-d'), from: 'contact_request_date_3i'

    fill_in :contact_client_signature, with: contact.client_signature

    select user.full_name, from: :contact_user_id

    fill_in :contact_signature_of_authorized_broker, with: contact.signature_of_authorized_broker

    click_button 'Create Contact'

    expect(page).to have_content 'Contact was successfully created.'
  end

  scenario 'should edit a contact (lead or client)' do
    visit edit_contact_path existing_contact

    fill_in :contact_full_name, with: contact.full_name

    select contact.date_of_birth.strftime('%Y'),
           from: 'contact_date_of_birth_1i'
    select contact.date_of_birth.strftime('%B'),
           from: 'contact_date_of_birth_2i'
    select contact.date_of_birth.strftime('%-d'),
           from: 'contact_date_of_birth_3i'

    fill_in :contact_present_address, with: contact.present_address
    fill_in :contact_community, with: contact.community
    fill_in :contact_length_of_stay_at_present_address,
            with: contact.length_of_stay_at_present_address
    fill_in :contact_mobile, with: contact.mobile
    fill_in :contact_occupation, with: contact.occupation
    fill_in :contact_email, with: contact.email

    check :contact_personal_property
    check :contact_jointly_owned_property
    check :contact_agent
    check :contact_has_authority_from_owner
    check :contact_has_site_plan
    check :contact_site_plan_request
    check :contact_search_report
    check :contact_search_report_request
    check :contact_valuation_report
    check :contact_valuation_report_request

    fill_in :contact_type_of_service, with: contact.type_of_service
    fill_in :contact_request_details, with: contact.request_details

    select contact.request_date.strftime('%Y'), from: 'contact_request_date_1i'
    select contact.request_date.strftime('%B'), from: 'contact_request_date_2i'
    select contact.request_date.strftime('%-d'), from: 'contact_request_date_3i'

    fill_in :contact_client_signature, with: contact.client_signature

    select user.full_name, from: :contact_user_id

    fill_in :contact_signature_of_authorized_broker,
            with: contact.signature_of_authorized_broker

    click_button 'Update Contact'

    expect(page).to have_content 'Contact was successfully updated.'
  end

  scenario 'should delete a contact (lead or client)' do
    visit contact_path existing_contact

    page.accept_confirm do
      click_link 'Delete Contact'
    end

    expect(page).to have_content 'Contact was successfully deleted.'
  end

  fscenario 'should view the details of a contact ' do
    visit contact_path existing_contact

    expect(page).to have_content existing_contact.full_name
    expect(page).to have_content existing_contact.date_of_birth.strftime('%Y')
    expect(page).to have_content existing_contact.date_of_birth.strftime('%B')
    expect(page).to have_content existing_contact.date_of_birth.strftime('%-d')
    expect(page).to have_content existing_contact.present_address
    expect(page).to have_content existing_contact.community
    expect(page).to have_content existing_contact.length_of_stay_at_present_address
    expect(page).to have_content existing_contact.mobile
    expect(page).to have_content existing_contact.occupation
    expect(page).to have_content existing_contact.email
    expect(page).to have_content existing_contact.personal_property
    expect(page).to have_content existing_contact.jointly_owned_property
    expect(page).to have_content existing_contact.agent
    expect(page).to have_content existing_contact.has_authority_from_owner
    expect(page).to have_content existing_contact.has_site_plan
    expect(page).to have_content existing_contact.site_plan_request
    expect(page).to have_content existing_contact.search_report
    expect(page).to have_content existing_contact.search_report_request
    expect(page).to have_content existing_contact.valuation_report
    expect(page).to have_content existing_contact.valuation_report_request
    expect(page).to have_content existing_contact.type_of_service
    expect(page).to have_content existing_contact.request_details
    expect(page).to have_content existing_contact.request_date.strftime('%Y')
    expect(page).to have_content existing_contact.request_date.strftime('%B')
    expect(page).to have_content existing_contact.request_date.strftime('%-d')
    expect(page).to have_content existing_contact.client_signature
    # expect(page).to have_content user.full_name
    expect(page).to have_content existing_contact.signature_of_authorized_broker
  end
end
