class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.date :date_of_birth
      t.text :present_address
      t.string :community
      t.integer :length_of_stay_at_present_address
      t.string :mobile
      t.string :occupation
      t.string :email
      t.boolean :personal_property
      t.boolean :jointly_owned_property
      t.boolean :agent
      t.boolean :has_authority_from_owner
      t.boolean :has_site_plan
      t.boolean :site_plan_request
      t.boolean :search_report
      t.boolean :search_report_request
      t.boolean :valuation_report
      t.boolean :valuation_report_request
      t.integer :type_of_service
      t.text :request_details
      t.date :request_date
      t.string :client_signature
      t.references :user, foreign_key: true
      t.string :signature_of_authorized_broker

      t.timestamps
    end
  end
end
