json.set! :data do
  json.array! @milestones do |milestone|
    json.partial! 'milestones/milestone', milestone: milestone
    json.url  "
              #{link_to 'Show', milestone }
              #{link_to 'Edit', edit_milestone_path(milestone)}
              #{link_to 'Destroy', milestone, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end