class Property < ApplicationRecord
  include Filterable

  belongs_to :contact, inverse_of: :properties
  has_many :deals, inverse_of: :property

  enum category: { residential: 0, commercial: 1 }
  enum property_type: { land: 0, house: 1, apartment: 2 }
  enum listing_type: { not_listed: 0, for_sale: 1, for_lease: 2 }

  scope :listing_type, ->(listing_type) { where listing_type: listing_type }

  def full_name
    "#{name} at #{location}"
  end
end
