class RemoveDepartmentFromMilestones < ActiveRecord::Migration[5.1]
  def change
    remove_column :milestones, :department, :integer
  end
end
