json.set! :data do
  json.array! @deals do |deal|
    json.partial! 'deals/deal', deal: deal
    json.url  "
              #{link_to 'Show', deal }
              #{link_to 'Edit', edit_deal_path(deal)}
              #{link_to 'Destroy', deal, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end