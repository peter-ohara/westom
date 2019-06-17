# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Property Management', js: true do
  let!(:contact1) { FactoryBot.create(:contact) }
  let!(:contact2) { FactoryBot.create(:contact) }
  let!(:property) { FactoryBot.build(:property, owner: contact2) }
  let!(:existing_property) { FactoryBot.create(:property, owner: contact1) }

  let!(:user) { FactoryBot.create(:user) }
  before :each do
    login_as user
  end

  scenario 'should be able to add a property to a contact' do
    visit root_path

    click_link 'Add New Property'

    fill_out_property_information(property)

    click_button 'Create Property'
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
      expect(page).to have_content existing_property.id
      expect(page).to have_link href: property_path(existing_property)
    end
  end

  scenario 'should be able to filter for properties that are for sale ' \
           'or for lease' do
    properties = FactoryBot.create_list(:property, 25)

    visit properties_path

    click_link 'Properties for Sale'
    expect(page).to have_link href: properties_path(listing_type: :for_sale), class: 'nav-item nav-link active'
    expect_each_property_to_have_listing_type('For Sale')
    expect(page).to have_current_path properties_path(listing_type: :for_sale)

    click_link 'Properties for Lease'
    expect(page).to have_link href: properties_path(listing_type: :for_lease), class: 'nav-item nav-link active'
    expect_each_property_to_have_listing_type('For Lease')
    expect(page).to have_current_path properties_path(listing_type: :for_lease)

    click_link 'All Properties'
    expect(page).to have_link href: properties_path, class: 'nav-item nav-link active'
    select '100', from: 'dttb-properties_length'

    # properties.count + 1 because another property was created using let! above
    expect(page.all('#dttb-properties tbody tr td.listing_type').count).to eq properties.count + 1
    expect(page).to have_current_path properties_path
  end
end

def fill_out_property_information(property)
  select property.owner.fully_identifying_information, from: :property_contact_id

  fill_in :property_description, with: property.description
  fill_in :property_location, with: property.location
  fill_in :property_price, with: property.price

  select property.category.titleize, from: 'property_category'
  select property.property_type.titleize, from: 'property_property_type'
  select property.listing_type.titleize, from: 'property_listing_type'
end

def expect_page_to_have_property_information(page, existing_property)
  expect(page).to have_content existing_property.description
  expect(page).to have_content existing_property.location
  expect(page).to have_content existing_property.category.titleize
  expect(page).to have_content existing_property.property_type.titleize
  expect(page).to have_content existing_property.listing_type.titleize
  expect(page).to have_content(
    ApplicationController.helpers
        .humanized_money_with_symbol(existing_property.price)
  )
  expect(page).to have_content existing_property.owner.full_name
end

def expect_each_property_to_have_listing_type(listing_type)
  page.all('#dttb-properties tbody tr td.listing_type').each do |td|
    expect(td).to have_text listing_type
  end
end
