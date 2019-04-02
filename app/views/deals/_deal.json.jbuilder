json.extract! deal, :id, :contact_id, :property_id, :type_of_service, :request_date, :request_details, :amount_cents, :deadline, :stage, :expiration_date, :created_at, :updated_at
json.url deal_url(deal, format: :json)
