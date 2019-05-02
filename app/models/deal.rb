class Deal < ApplicationRecord
  include Filterable

  monetize :amount_cents

  belongs_to :contact, inverse_of: :deals
  belongs_to :property, inverse_of: :deals
  belongs_to :broker,
             class_name: 'User',
             foreign_key: :user_id,
             inverse_of: :deals

  enum type_of_service: { acquisition_of_property: 0,
                          sale_of_property: 1,
                          rental_of_property: 2,
                          land_registration_or_search: 3,
                          due_diligence: 4,
                          property_management_services: 5 }

  enum stage: { interest: 0,
                offer: 1,
                negotiation: 2,
                sales_purchase_agreement: 3,
                amount_paid: 4,
                closed: 5,
                cancelled: 6 }

  scope :stage_higher_than, ->(stage) {
    where('stage > ? AND stage < 5', stage)
  }

  scope :expires_by, ->(date) {
    where('expiration_date < ?', date)
  }

  scope :last_month, -> {
                       where('request_date > ? AND request_date < ?',
                             Date.today.last_month.beginning_of_month,
                             Date.today.beginning_of_month)
                     }

  scope :last_year, -> {
    where('request_date > ? AND request_date < ?',
          Date.today.beginning_of_year,
          Date.today)
  }

  def deal_number
    id
  end

  def name
    "#{id} - #{type_of_service.titleize} to #{contact.full_name}"
  end
end
