class Contact < ApplicationRecord
  has_many :properties, inverse_of: :owner
  has_many :deals, inverse_of: :contact
  has_many :brokers, through: :deals

  accepts_nested_attributes_for :properties,
                                allow_destroy: true,
                                reject_if: :all_blank

  enum type_of_service: { acquisition_of_property: 0,
                          sale_of_property: 1,
                          rental_of_property: 2,
                          land_registration_or_search: 3,
                          due_diligence: 4,
                          property_management_services: 5 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def fully_identifying_information
    "#{full_name} (#{mobile})"
  end
end
