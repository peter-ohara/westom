# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Property Management', js: true do
  let!(:contact1) { FactoryBot.create(:contact) }
  let!(:contact2) { FactoryBot.create(:contact) }
  let!(:property) { FactoryBot.build(:property) }
  let!(:existing_property) { FactoryBot.create(:property, contact: contact1) }

  let!(:user) { FactoryBot.create(:user) }
  before :each do
    login_as user
  end

  scenario 'should be able to add a property to a contact' do
    visit contact_path contact1

    click_link 'Add New Property'

    fill_out_property_information(property)

    click_button 'Create Property'
    expect(page).to have_current_path contact_path contact1
    expect(page).to have_content 'Property was successfully created.'
  end

  scenario 'should edit a property' do
    visit edit_property_path existing_property
    fill_out_property_information(property)
    click_button 'Update Property'
    expect(page).to have_content 'Property was successfully updated.'
  end

  scenario 'should delete a property' do
    visit property_path existing_property

    page.accept_confirm do
      click_link 'DELETE'
    end

    expect(page).to have_content 'Property was successfully deleted.'
  end

  scenario 'should view the details of a property ' do
    visit property_path existing_property
    expect_page_to_have_property_information(page, existing_property)
  end

  scenario 'should be able to view all properties that have been assigned to ' \
           'a contact' do
    visit contact_path contact1
    within :css, '#properties' do
      expect(page).to have_content existing_property.name
      expect(page).to have_link href: property_path(existing_property)
    end
  end
end

def fill_out_property_information(property)
  fill_in :property_name, with: property.name

  fill_in :property_description, with: property.description
  fill_in :property_location, with: property.location

  select property.category.titleize, from: 'property_category'
  select property.property_type.titleize, from: 'property_property_type'
end

def expect_page_to_have_property_information(page, existing_property)
  expect(page).to have_content existing_property.name
  expect(page).to have_content existing_property.description
  expect(page).to have_content existing_property.location
  expect(page).to have_content existing_property.category.titleize
  expect(page).to have_content existing_property.property_type.titleize
  expect(page).to have_content existing_property.contact.full_name
end
