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
  has_many :contacts, inverse_of: :broker

  has_many :user_milestones, inverse_of: :user
  has_many :milestones, through: :user_milestones

  def full_name
    "#{first_name} #{last_name}"
  end
end
