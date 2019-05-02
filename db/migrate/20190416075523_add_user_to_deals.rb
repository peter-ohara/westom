class AddUserToDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :deals, :user, foreign_key: true
  end
end
