class Activity < ApplicationRecord
  belongs_to :broker,
             class_name: 'User',
             foreign_key: :user_id,
             inverse_of: :activities

  belongs_to :deal, inverse_of: :activities
end
