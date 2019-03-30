class Property < ApplicationRecord
  belongs_to :contact, inverse_of: :properties
  enum category: { residential: 0, commercial: 1 }
  enum property_type: { land: 0, house: 1, apartment: 2 }
end
