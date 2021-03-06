class Milestone < ApplicationRecord
  include Filterable

  enum target_type: { revenue: 0,
                      deals: 1 }

  enum status: { active: 0,
                 archived: 1 }

  has_many :user_milestones, inverse_of: :milestone
  has_many :users, through: :user_milestones

  scope :status, ->(status) { where status: status }

  def deals
    Deal.joins("INNER JOIN users ON users.id = deals.user_id")
        .where('date_of_closing > ? AND date_of_closing < ?',
               start_date,
               due_date)
  end

  def progress
    return deals.count if target_type == :deals.to_s

    deals.sum(:amount_cents).to_money / 100
  end

  def target
    return self[:target].to_i if target_type == :deals.to_s

    self[:target].to_money
  end

  def target_name
    return 'Deals' if target_type == :deals.to_s

    'Revenue'
  end
end
