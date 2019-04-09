class Milestone < ApplicationRecord
  enum target_type: { revenue: 0,
                      deals: 1 }

  enum department: { brokers: 0,
                     due_diligence: 1,
                     administrators: 2 }

  enum status: { active: 0,
                 archived: 1 }

  def deals
    Deal.closed.where('date_of_closing > ? AND date_of_closing < ?', start_date, due_date)
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
