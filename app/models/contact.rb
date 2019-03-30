class Contact < ApplicationRecord
  belongs_to :broker,
             class_name: 'User',
             foreign_key: :user_id,
             inverse_of: :contacts

  has_many :properties, inverse_of: :contact
  accepts_nested_attributes_for :properties,
                                allow_destroy: true,
                                reject_if: :all_blank
end
