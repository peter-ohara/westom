class UserMilestone < ApplicationRecord
  belongs_to :user
  belongs_to :milestone
end
