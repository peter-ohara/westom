json.set! :data do
  json.array! @activities do |activity|
    json.partial! 'activities/activity', activity: activity
    json.url  "
              #{link_to 'Show', activity }
              #{link_to 'Edit', edit_activity_path(activity)}
              #{link_to 'Destroy', activity, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end