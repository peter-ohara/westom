class User < ApplicationRecord
  has_many :contacts, inverse_of: :broker

  def full_name
    "#{first_name} #{last_name}"
  end
end
