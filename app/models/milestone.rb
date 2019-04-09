class Milestone < ApplicationRecord
  enum target_type: { revenue: 0,
                      deals: 1 }

  enum department: { brokers: 0,
                     due_diligence: 1,
                     administrators: 2 }

  enum status: { active: 0,
                 archived: 1 }

  def progress
    100
  end
end
