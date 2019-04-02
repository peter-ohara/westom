class Property < ApplicationRecord
  belongs_to :contact, inverse_of: :properties
  has_many :deals, inverse_of: :property

  enum category: { residential: 0, commercial: 1 }
  enum property_type: { land: 0, house: 1, apartment: 2 }

  def full_name
    "#{name} at #{location}"
  end
end
