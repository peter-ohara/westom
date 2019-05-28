json.extract! activity, :id, :user_id, :deal_id, :title, :description, :due_date, :completion_date, :created_at, :updated_at
json.url activity_url(activity, format: :json)
