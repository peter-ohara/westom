class Contact < ApplicationRecord
  belongs_to :broker, class_name: 'User', foreign_key: :user_id
end
