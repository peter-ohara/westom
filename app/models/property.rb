# frozen_string_literal: true

class Property < ApplicationRecord
  include Filterable

  monetize :price_cents

  belongs_to :owner,
             class_name: 'Contact',
             foreign_key: :contact_id,
             inverse_of: :properties

  has_many :deals, inverse_of: :property
  has_many :brokers, through: :deals

  enum category: { residential: 0,
                   commercial: 1,
                   residential_or_commercial: 3 }
  enum property_type: { land: 0,
                        house: 1,
                        apartment: 2,
                        building: 3,
                        warehouse: 4,
                        town_house: 5 }
  enum listing_type: { not_listed: 0,
                       for_sale: 1,
                       for_lease: 2,
                       for_rent_or_lease: 3 }

  scope :listing_type, ->(listing_type) { where listing_type: listing_type }

  def name
    "#{id} for #{owner.full_name}"
  end

  def full_name
    "#{name} at #{location}"
  end
end
