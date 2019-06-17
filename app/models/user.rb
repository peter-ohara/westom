class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :timeoutable,
         :lockable

  has_many :deals, inverse_of: :broker
  has_many :properties, through: :deals
  has_many :contacts, through: :deals

  has_many :user_milestones, inverse_of: :user
  has_many :milestones, through: :user_milestones

  has_many :activities, inverse_of: :broker

  def full_name
    "#{first_name} #{last_name}"
  end

  def fully_identifying_information
    "#{full_name} (#{mobile})"
  end
end
