class Contact < ApplicationRecord
  belongs_to :broker,
             class_name: 'User',
             foreign_key: :user_id,
             inverse_of: :contacts

  has_many :properties, inverse_of: :contact
  accepts_nested_attributes_for :properties,
                                allow_destroy: true,
                                reject_if: :all_blank

  enum type_of_service: { acquisition_of_property: 0,
                          sale_of_property: 1,
                          rental_of_property: 2,
                          land_registration_or_search: 3,
                          due_diligence: 4,
                          property_management_services: 5 }
end
