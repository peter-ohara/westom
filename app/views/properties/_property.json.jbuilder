# frozen_string_literal: true

json.extract! property, :id,
              :description,
              :location,
              :category,
              :property_type,
              :price,
              :negotiable,
              :status,
              :contact_id,
              :created_at,
              :updated_at
json.url property_url(property, format: :json)
